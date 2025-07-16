-- Enable Row Level Security (RLS) on all tables
ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.orders ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.order_items ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.cart_items ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.user_favorite_stores ENABLE ROW LEVEL SECURITY;

-- Profiles: Users can only access their own profile
CREATE POLICY "Users can view own profile" ON public.profiles
    FOR SELECT USING (auth.uid() = id);

CREATE POLICY "Users can update own profile" ON public.profiles
    FOR UPDATE USING (auth.uid() = id);

CREATE POLICY "Users can insert own profile" ON public.profiles
    FOR INSERT WITH CHECK (auth.uid() = id);

-- Orders: Users can only access their own orders
CREATE POLICY "Users can view own orders" ON public.orders
    FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own orders" ON public.orders
    FOR INSERT WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update own orders" ON public.orders
    FOR UPDATE USING (auth.uid() = user_id);

-- Order Items: Users can access order items for their own orders
CREATE POLICY "Users can view own order items" ON public.order_items
    FOR SELECT USING (
        EXISTS (
            SELECT 1 FROM public.orders 
            WHERE orders.id = order_items.order_id 
            AND orders.user_id = auth.uid()
        )
    );

CREATE POLICY "Users can insert own order items" ON public.order_items
    FOR INSERT WITH CHECK (
        EXISTS (
            SELECT 1 FROM public.orders 
            WHERE orders.id = order_items.order_id 
            AND orders.user_id = auth.uid()
        )
    );

-- Cart Items: Users can only access their own cart items
CREATE POLICY "Users can view own cart items" ON public.cart_items
    FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own cart items" ON public.cart_items
    FOR INSERT WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update own cart items" ON public.cart_items
    FOR UPDATE USING (auth.uid() = user_id);

CREATE POLICY "Users can delete own cart items" ON public.cart_items
    FOR DELETE USING (auth.uid() = user_id);

-- User Favorite Stores: Users can only access their own favorites
CREATE POLICY "Users can view own favorite stores" ON public.user_favorite_stores
    FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own favorite stores" ON public.user_favorite_stores
    FOR INSERT WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can delete own favorite stores" ON public.user_favorite_stores
    FOR DELETE USING (auth.uid() = user_id);

-- Public read access for reference data (no authentication required)
ALTER TABLE public.menu_categories ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.menus ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.menu_options ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.stores ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.store_congestion ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.promotions ENABLE ROW LEVEL SECURITY;

-- Menu Categories: Public read access
CREATE POLICY "Anyone can view active menu categories" ON public.menu_categories
    FOR SELECT USING (is_active = true);

-- Menus: Public read access for available items
CREATE POLICY "Anyone can view available menus" ON public.menus
    FOR SELECT USING (is_available = true);

-- Menu Options: Public read access
CREATE POLICY "Anyone can view menu options" ON public.menu_options
    FOR SELECT USING (true);

-- Stores: Public read access for active stores
CREATE POLICY "Anyone can view active stores" ON public.stores
    FOR SELECT USING (is_active = true);

-- Store Congestion: Public read access
CREATE POLICY "Anyone can view store congestion" ON public.store_congestion
    FOR SELECT USING (true);

-- Promotions: Public read access for active promotions
CREATE POLICY "Anyone can view active promotions" ON public.promotions
    FOR SELECT USING (
        is_active = true 
        AND start_date <= CURRENT_DATE 
        AND end_date >= CURRENT_DATE
    );

-- Functions for order management (can be used by authenticated users)
CREATE OR REPLACE FUNCTION generate_order_number()
RETURNS TEXT AS $$
DECLARE
    order_num TEXT;
    current_date_str TEXT;
    sequence_num INTEGER;
BEGIN
    -- Format: FL + YYMMDD + sequential number (001, 002, etc.)
    current_date_str := TO_CHAR(NOW(), 'YYMMDD');
    
    -- Get the next sequence number for today
    SELECT COALESCE(MAX(CAST(SUBSTRING(order_number FROM 9) AS INTEGER)), 0) + 1
    INTO sequence_num
    FROM public.orders
    WHERE order_number LIKE 'FL' || current_date_str || '%';
    
    -- Generate the order number
    order_num := 'FL' || current_date_str || LPAD(sequence_num::TEXT, 3, '0');
    
    RETURN order_num;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Trigger to automatically generate order number
CREATE OR REPLACE FUNCTION set_order_number()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.order_number IS NULL OR NEW.order_number = '' THEN
        NEW.order_number := generate_order_number();
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER set_order_number_trigger
    BEFORE INSERT ON public.orders
    FOR EACH ROW
    EXECUTE FUNCTION set_order_number();

-- Function to automatically create user profile after signup
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO public.profiles (id, email, name)
    VALUES (NEW.id, NEW.email, COALESCE(NEW.raw_user_meta_data->>'name', 'User'));
    RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Trigger to create profile when user signs up
CREATE TRIGGER on_auth_user_created
    AFTER INSERT ON auth.users
    FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();