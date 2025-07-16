-- Create Storage Buckets for Fluffee Cafe

-- 1. Menu Images Bucket
INSERT INTO storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
VALUES (
    'menu-images',
    'menu-images',
    true,
    5242880, -- 5MB limit
    ARRAY['image/jpeg', 'image/png', 'image/webp']
);

-- 2. Profile Images Bucket
INSERT INTO storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
VALUES (
    'profile-images',
    'profile-images',
    true,
    2097152, -- 2MB limit
    ARRAY['image/jpeg', 'image/png', 'image/webp']
);

-- 3. Promotion Images Bucket
INSERT INTO storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
VALUES (
    'promotion-images',
    'promotion-images',
    true,
    10485760, -- 10MB limit
    ARRAY['image/jpeg', 'image/png', 'image/webp']
);

-- Storage Policies

-- Menu Images: Public read access, no upload restrictions for now
CREATE POLICY "Public Access" ON storage.objects FOR SELECT
    USING (bucket_id = 'menu-images');

CREATE POLICY "Anyone can upload menu images" ON storage.objects FOR INSERT
    WITH CHECK (bucket_id = 'menu-images');

-- Profile Images: Public read, authenticated upload (users can upload their own)
CREATE POLICY "Public Access" ON storage.objects FOR SELECT
    USING (bucket_id = 'profile-images');

CREATE POLICY "Users can upload profile images" ON storage.objects FOR INSERT
    WITH CHECK (
        bucket_id = 'profile-images' 
        AND auth.role() = 'authenticated'
    );

CREATE POLICY "Users can update own profile images" ON storage.objects FOR UPDATE
    USING (
        bucket_id = 'profile-images' 
        AND auth.uid()::text = (storage.foldername(name))[1]
    );

CREATE POLICY "Users can delete own profile images" ON storage.objects FOR DELETE
    USING (
        bucket_id = 'profile-images' 
        AND auth.uid()::text = (storage.foldername(name))[1]
    );

-- Promotion Images: Public read access
CREATE POLICY "Public Access" ON storage.objects FOR SELECT
    USING (bucket_id = 'promotion-images');

CREATE POLICY "Anyone can upload promotion images" ON storage.objects FOR INSERT
    WITH CHECK (bucket_id = 'promotion-images');