-- CREATE: Tambah restoran dan ulasan
INSERT INTO restaurant (name, street_address, description)
VALUES ('Kedai Rempah', 'Jl. Anggrek No. 12', 'Hidangan berbumbu rempah')
RETURNING id, name;

INSERT INTO review (restaurant_id, user_name, rating, review_text, review_date)
VALUES (1, 'Farah', 5, 'Satenya enak dan pelayanannya cepat.', '2026-11-12')
RETURNING id, restaurant_id, user_name, rating;

-- READ: Tampilkan ulasan Dapur Nusantara
SELECT id, user_name, rating, review_text, review_date
FROM review
WHERE restaurant_id = 1
ORDER BY id;

-- READ: Tampilkan ulasan dengan rating 4 ke atas
SELECT id, restaurant_id, user_name, rating
FROM review
WHERE rating >= 4
ORDER BY id;

-- READ: Tampilkan restoran beserta ulasannya
SELECT r.name AS restoran, v.user_name AS pengulas, v.rating, v.review_text
FROM restaurant AS r
LEFT JOIN review AS v ON r.id = v.restaurant_id
ORDER BY r.id, v.id;

-- UPDATE: Ubah deskripsi Kedai Rempah
UPDATE restaurant
SET description = 'Restoran keluarga dengan hidangan khas berbumbu rempah'
WHERE id = 4
RETURNING id, name, description;

-- UPDATE: Ubah rating ulasan Farah
UPDATE review
SET rating = 4
WHERE id = 6
RETURNING id, user_name, rating;

-- DELETE: Hapus ulasan Doni
DELETE FROM review
WHERE id = 4 AND user_name = 'Doni'
RETURNING id, user_name, rating;

-- Cek ulasan Warung Pesisir sebelum restorannya dihapus
SELECT id, restaurant_id, user_name, rating
FROM review
WHERE restaurant_id = 3;

-- DELETE: Hapus Warung Pesisir dan ulasannya melalui ON DELETE CASCADE
DELETE FROM restaurant
WHERE id = 3 AND name = 'Warung Pesisir'
RETURNING id, name;

-- Pastikan ulasan Warung Pesisir sudah ikut terhapus
SELECT id, restaurant_id, user_name, rating
FROM review
WHERE restaurant_id = 3;0