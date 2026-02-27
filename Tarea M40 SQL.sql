-- SQLite
SELECT COUNT(*) AS filas FROM housing;

SELECT zipcode,yr_built,
  AVG(price) AS precio_promedio,
  AVG(bedrooms) AS bedrooms_promedio,
  AVG(bathrooms) AS bathrooms_promedio
FROM housing
GROUP BY zipcode, yr_built
ORDER BY precio_promedio DESC
LIMIT 50;

SELECT zipcode,
  AVG(price / (sqft_living / 10.7639)) AS precio_por_m2
FROM housing
GROUP BY zipcode
ORDER BY precio_por_m2 DESC;

SELECT *
FROM housing
WHERE
  (yr_renovated > 0 OR yr_renovated = 0)
  AND yr_built >= 1950
  AND waterfront IN (0,1);

SELECT
  id,
  price,
  zipcode,
  lat,
  long
FROM housing;

--Análisis adicionales--
--Precio por condición de la casa--
SELECT
  condition,
  AVG(price) AS precio_promedio
FROM housing
GROUP BY condition
ORDER BY precio_promedio DESC;

--Precio promedio por vista al lago--
SELECT
  waterfront,
  AVG(price) AS precio_promedio
FROM housing
GROUP BY waterfront;

