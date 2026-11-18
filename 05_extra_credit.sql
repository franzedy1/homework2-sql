-- 1. Buat tabel menu
CREATE TABLE menu (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    restaurant_id INTEGER NOT NULL REFERENCES restaurant(id) ON DELETE CASCADE,
    item_name TEXT NOT NULL,
    price NUMERIC(10, 2) NOT NULL CHECK (price >= 0)
);

-- 2. Masukkan tiga item menu per restoran
INSERT INTO menu (restaurant_id, item_name, price)
VALUES
    (1, 'Nasi Rendang', 35000),
    (1, 'Sate Ayam', 28000),
    (1, 'Es Teh Manis', 8000),
    (2, 'Kopi Susu', 22000),
    (2, 'Roti Bakar', 18000),
    (2, 'Pisang Goreng', 15000),
    (4, 'Ayam Bakar Rempah', 32000),
    (4, 'Nasi Goreng Rempah', 27000),
    (4, 'Teh Jahe', 12000);

-- 3. Tampilkan menu dan rata-rata rating tiap restoran
SELECT
    r.name AS restoran,
    m.item_name AS menu,
    m.price AS harga,
    u.rata_rata_rating
FROM restaurant AS r
LEFT JOIN menu AS m ON r.id = m.restaurant_id
LEFT JOIN (
    SELECT restaurant_id, ROUND(AVG(rating), 2) AS rata_rata_rating
    FROM review
    GROUP BY restaurant_id
) AS u ON r.id = u.restaurant_id
ORDER BY r.id, m.id;