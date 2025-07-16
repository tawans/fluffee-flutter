-- Sample data for Fluffee Cafe

-- 1. Menu Categories
INSERT INTO public.menu_categories (id, name, name_en, description, sort_order) VALUES
('550e8400-e29b-41d4-a716-446655440001', '커피', 'Coffee', 'Fluffee의 시그니처 커피 메뉴', 1),
('550e8400-e29b-41d4-a716-446655440002', '티', 'Tea', '프리미엄 티 컬렉션', 2),
('550e8400-e29b-41d4-a716-446655440003', '스무디', 'Smoothie', '신선한 과일 스무디', 3),
('550e8400-e29b-41d4-a716-446655440004', '디저트', 'Dessert', '달콤한 디저트와 베이커리', 4);

-- 2. Coffee Menus
INSERT INTO public.menus (id, category_id, name, name_en, description, price, calories, is_popular, is_recommended, sort_order) VALUES
('660e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440001', '플러피 라떼', 'Fluffy Latte', '부드럽고 크리미한 Fluffee만의 시그니처 라떼', 5500, 180, true, true, 1),
('660e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440001', '아메리카노', 'Americano', '깔끔하고 진한 에스프레소의 맛', 4000, 10, true, false, 2),
('660e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440001', '카푸치노', 'Cappuccino', '진한 에스프레소와 부드러운 우유 거품', 5000, 120, false, true, 3),
('660e8400-e29b-41d4-a716-446655440004', '550e8400-e29b-41d4-a716-446655440001', '바닐라 라떼', 'Vanilla Latte', '달콤한 바닐라 시럽이 들어간 라떼', 5800, 220, true, false, 4),
('660e8400-e29b-41d4-a716-446655440005', '550e8400-e29b-41d4-a716-446655440001', '카라멜 마키아토', 'Caramel Macchiato', '달콤한 카라멜과 에스프레소의 조화', 6000, 250, false, true, 5);

-- 3. Tea Menus
INSERT INTO public.menus (id, category_id, name, name_en, description, price, calories, is_popular, is_recommended, sort_order) VALUES
('660e8400-e29b-41d4-a716-446655440006', '550e8400-e29b-41d4-a716-446655440002', '얼그레이', 'Earl Grey', '클래식한 영국 전통 홍차', 4500, 5, false, false, 1),
('660e8400-e29b-41d4-a716-446655440007', '550e8400-e29b-41d4-a716-446655440002', '캐모마일 티', 'Chamomile Tea', '편안한 휴식을 주는 허브티', 4800, 2, true, true, 2),
('660e8400-e29b-41d4-a716-446655440008', '550e8400-e29b-41d4-a716-446655440002', '녹차 라떼', 'Green Tea Latte', '진한 녹차와 우유의 조화', 5200, 160, true, false, 3),
('660e8400-e29b-41d4-a716-446655440009', '550e8400-e29b-41d4-a716-446655440002', '레몬 허니 티', 'Lemon Honey Tea', '상큼한 레몬과 달콤한 꿀', 5000, 80, false, true, 4);

-- 4. Smoothie Menus
INSERT INTO public.menus (id, category_id, name, name_en, description, price, calories, is_popular, is_recommended, sort_order) VALUES
('660e8400-e29b-41d4-a716-446655440010', '550e8400-e29b-41d4-a716-446655440003', '딸기 바나나 스무디', 'Strawberry Banana Smoothie', '달콤한 딸기와 바나나의 완벽한 조화', 6500, 280, true, true, 1),
('660e8400-e29b-41d4-a716-446655440011', '550e8400-e29b-41d4-a716-446655440003', '망고 스무디', 'Mango Smoothie', '트로피컬 망고의 진한 맛', 6800, 320, true, false, 2),
('660e8400-e29b-41d4-a716-446655440012', '550e8400-e29b-41d4-a716-446655440003', '블루베리 스무디', 'Blueberry Smoothie', '항산화 성분이 풍부한 블루베리', 7000, 290, false, true, 3);

-- 5. Dessert Menus
INSERT INTO public.menus (id, category_id, name, name_en, description, price, calories, is_popular, is_recommended, sort_order) VALUES
('660e8400-e29b-41d4-a716-446655440013', '550e8400-e29b-41d4-a716-446655440004', '치즈케이크', 'Cheesecake', '부드럽고 진한 크림치즈 케이크', 7500, 450, true, true, 1),
('660e8400-e29b-41d4-a716-446655440014', '550e8400-e29b-41d4-a716-446655440004', '초콜릿 브라우니', 'Chocolate Brownie', '진한 초콜릿의 달콤함', 6000, 380, true, false, 2),
('660e8400-e29b-41d4-a716-446655440015', '550e8400-e29b-41d4-a716-446655440004', '크루아상', 'Croissant', '바삭하고 버터향 가득한 페이스트리', 3500, 280, false, false, 3),
('660e8400-e29b-41d4-a716-446655440016', '550e8400-e29b-41d4-a716-446655440004', '마카롱 세트', 'Macaron Set', '알록달록한 프랑스 전통 마카롱 (5개)', 12000, 400, false, true, 4);

-- 6. Menu Options (사이즈, 온도 등)
INSERT INTO public.menu_options (menu_id, option_type, option_name, price_adjustment, is_default) VALUES
-- 커피 사이즈 옵션
('660e8400-e29b-41d4-a716-446655440001', 'size', 'Regular', 0, true),
('660e8400-e29b-41d4-a716-446655440001', 'size', 'Large', 500, false),
('660e8400-e29b-41d4-a716-446655440002', 'size', 'Regular', 0, true),
('660e8400-e29b-41d4-a716-446655440002', 'size', 'Large', 500, false),
-- 온도 옵션
('660e8400-e29b-41d4-a716-446655440001', 'temperature', 'Hot', 0, true),
('660e8400-e29b-41d4-a716-446655440001', 'temperature', 'Iced', 0, false),
('660e8400-e29b-41d4-a716-446655440002', 'temperature', 'Hot', 0, true),
('660e8400-e29b-41d4-a716-446655440002', 'temperature', 'Iced', 0, false);

-- 7. Sample Stores
INSERT INTO public.stores (id, name, address, phone, latitude, longitude, operating_hours) VALUES
('770e8400-e29b-41d4-a716-446655440001', 'Fluffee 강남점', '서울특별시 강남구 역삼동 123-45', '02-1234-5678', 37.4979, 127.0276, '{"mon": "07:00-22:00", "tue": "07:00-22:00", "wed": "07:00-22:00", "thu": "07:00-22:00", "fri": "07:00-22:00", "sat": "08:00-22:00", "sun": "08:00-22:00"}'),
('770e8400-e29b-41d4-a716-446655440002', 'Fluffee 홍대점', '서울특별시 마포구 홍익로 89-12', '02-2345-6789', 37.5563, 126.9233, '{"mon": "07:00-23:00", "tue": "07:00-23:00", "wed": "07:00-23:00", "thu": "07:00-23:00", "fri": "07:00-24:00", "sat": "08:00-24:00", "sun": "08:00-23:00"}'),
('770e8400-e29b-41d4-a716-446655440003', 'Fluffee 신촌점', '서울특별시 서대문구 신촌동 67-89', '02-3456-7890', 37.5596, 126.9423, '{"mon": "07:00-22:00", "tue": "07:00-22:00", "wed": "07:00-22:00", "thu": "07:00-22:00", "fri": "07:00-22:00", "sat": "08:00-22:00", "sun": "08:00-22:00"}'),
('770e8400-e29b-41d4-a716-446655440004', 'Fluffee 잠실점', '서울특별시 송파구 잠실동 456-78', '02-4567-8901', 37.5136, 127.1026, '{"mon": "07:00-22:00", "tue": "07:00-22:00", "wed": "07:00-22:00", "thu": "07:00-22:00", "fri": "07:00-22:00", "sat": "08:00-22:00", "sun": "08:00-22:00"}');

-- 8. Store Congestion (초기 데이터)
INSERT INTO public.store_congestion (store_id, congestion_level) VALUES
('770e8400-e29b-41d4-a716-446655440001', 'medium'),
('770e8400-e29b-41d4-a716-446655440002', 'high'),
('770e8400-e29b-41d4-a716-446655440003', 'low'),
('770e8400-e29b-41d4-a716-446655440004', 'medium');

-- 9. Sample Promotions
INSERT INTO public.promotions (title, description, start_date, end_date) VALUES
('신메뉴 출시 기념 할인', '새로운 플러피 라떼 출시를 기념하여 20% 할인!', '2024-01-01', '2024-01-31'),
('겨울 시즌 스페셜', '따뜻한 음료 2잔 구매시 1잔 무료!', '2023-12-01', '2024-02-29'),
('오픈 1주년 기념 이벤트', 'Fluffee와 함께한 1년! 감사의 마음을 담아 특별 할인', '2024-03-01', '2024-03-15');