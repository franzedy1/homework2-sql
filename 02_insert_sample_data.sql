INSERT INTO restaurant (name, street_address, description)
VALUES
    ('Dapur Nusantara', 'Jl. Melati No. 10', 'Masakan khas Indonesia'),
    ('Kedai Sore', 'Jl. Kenanga No. 25', 'Kopi dan makanan ringan'),
    ('Warung Pesisir', 'Jl. Mawar No. 8', 'Hidangan laut');

INSERT INTO review (restaurant_id, user_name, rating, review_text, review_date)
VALUES
    (1, 'Ayu', 5, 'Rendangnya enak dan pelayanannya ramah.', '2026-11-01'),
    (1, 'Bima', 4, 'Porsinya pas dan tempatnya bersih.', '2026-11-03'),
    (2, 'Citra', 4, 'Kopinya enak dan suasananya nyaman.', '2026-11-05'),
    (2, 'Doni', 3, 'Pesanan agak lama datang.', '2026-11-07'),
    (3, 'Eka', 5, 'Ikan bakarnya segar dan bumbunya enak.', '2026-11-09');