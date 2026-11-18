-- 1. Restoran dengan rata-rata rating tertinggi
SELECT r.name AS restoran, ROUND(AVG(v.rating), 2) AS rata_rata_rating
FROM restaurant AS r
JOIN review AS v ON r.id = v.restaurant_id
GROUP BY r.id, r.name
ORDER BY AVG(v.rating) DESC
LIMIT 1;

-- 2. Jumlah ulasan tiap restoran
SELECT r.name AS restoran, COUNT(v.id) AS jumlah_ulasan
FROM restaurant AS r
LEFT JOIN review AS v ON r.id = v.restaurant_id
GROUP BY r.id, r.name
ORDER BY r.id;

-- 3. Ulasan terbaru tiap restoran
SELECT DISTINCT ON (r.id)
    r.name AS restoran,
    v.user_name AS pengulas,
    v.rating,
    v.review_date AS tanggal_ulasan,
    v.review_text AS isi_ulasan
FROM restaurant AS r
LEFT JOIN review AS v ON r.id = v.restaurant_id
ORDER BY r.id, v.review_date DESC, v.id DESC;