-- 1. Лысые злодеи 90х годов
--     - Описание: Отобразите имя, первое появление, частота появления. Выведите только тех персонажей, у которых Bald и они злодеи. Год появления между 1990 и 1999
--     - Выборка: Имя, год первого появления, количество появлений; где прическа — Bald, align — Bad Characters, и год первого появления между 1990 и 1999. 
--     - Количество строк: 94

SELECT name, first_appearance, appearances
FROM MarvelCharacters
WHERE hair = 'Bald' AND align = 'Bad Characters' 
AND Year BETWEEN '1990' AND '1999';


-- 2. Герои с тайной идентичностью и необычными глазами
--     - Описание: Вывести имя, год первого появления, и цвет глаз. Выбрать персонажей с тайной идентичностью (Secret Identity) и цветом глаз не из обычного спектра (не Blue, Brown, Green).
--     - Выборка: Имя, год первого появления, цвет глаз; где идентификация — Secret Identity, и цвет глаз не Blue, Brown, или Green.
--     - Количество строк: 1080

SELECT name, first_appearance, eye
FROM MarvelCharacters
WHERE identify = 'Secret Identity' AND eye NOT IN ('Blue Eyes', 'Brown Eyes', 'Green Eyes');

-- 3. Персонажи с изменяющимся цветом волос
--     - Описание: Вывести имя и описание цвета волос. Интересуют персонажи с переменным цветом волос (Variable Hair).
--     - Выборка: Имя и описание цвета волос; где цвет волос — Variable Hair.
--     - Количество строк: 32

SELECT name, hair
FROM MarvelCharacters
WHERE hair = 'Variable Hair';

-- 4. Женские персонажи с редким цветом глаз
--     - Описание: Вывести имена и цвет глаз. Отфильтровать женских персонажей с цветом глаз Gold или Amber.
--     - Выборка: Имя, цвет глаз; где пол — женский и цвет глаз Gold или Amber.
--     - Количество строк: 5

SELECT name, eye
FROM MarvelCharacters
WHERE sex = 'Female Characters' AND (eye LIKE '%Gold Eyes' OR eye LIKE '%Amber Eyes');

-- 5. Персонажи без двойной идентичности, сортированные по году появления
--     - Описание: Вывести имя и год первого появления FIRST_APPEARANCE. Выбрать персонажей без двойной идентичности (No Dual Identity), сортировка по году появления, сначала новые.
--     - Выборка: Имя, год первого появления; где нет двойной идентичности, сортировка по году Year по убыванию.
--     - Количество строк: 1788

SELECT name, first_appearance
FROM MarvelCharacters
WHERE identify = 'No Dual Identity'
ORDER BY Year DESC;

-- 6. Герои и злодеи с необычными прическами
--     - Описание: Вывести имя, align, и описание прически. Найти персонажей с прическами, не являющимися стандартными (не Brown, Black, Blond, Red), а также их сторону (align) где align Good Characters или Bad Characters.
--     - Выборка: Имя, align, описание прически; где прическа не Brown, Black, Blond, или Red.
--     - Количество строк: 2744
    
SELECT name, align, hair
FROM MarvelCharacters
WHERE hair NOT IN ('Brown Hair', 'Black Hair', 'Blond Hair', 'Red Hair') AND (align LIKE '%Good Characters' OR align LIKE '%Bad Characters');

-- 7. Персонажи, появившиеся в определённое десятилетие
--     - Описание: Вывести имя и год первого появления. Найти персонажей, первое появление которых приходится на 1960-е годы.
--     - Выборка: Имя, год первого появления; где год первого появления между 1960 и 1969.
--     - Количество строк: 1306


SELECT name, first_appearance
FROM MarvelCharacters
WHERE Year BETWEEN '1960' AND '1969';


-- 8. Персонажи с уникальным сочетанием цвета глаз и волос
--     - Описание: Вывести имя, цвет глаз, и цвет волос. Найти персонажей с сочетанием цвета глаз Yellow и цвета волос Red.
--     - Выборка: Имя, цвет глаз, цвет волос; где цвет глаз — Yellow и цвет волос — Red.
--     - Количество строк: 13

SELECT name, eye, hair
FROM MarvelCharacters
WHERE eye = 'Yellow Eyes' AND hair = 'Red Hair';


-- 9. Персонажи с ограниченным количеством появлений
--     - Описание: Вывести имя и количество появлений. Выбрать персонажей, количество появлений которых меньше 10.
--     - Выборка: Имя, количество появлений; где количество появлений меньше 10.
--     - Количество строк: 11938

SELECT name, appearances
FROM MarvelCharacters
WHERE appearances < 10;


-- 10. Персонажи с наибольшим количеством появлений
--      - Описание: Вывести первые 5 имен и количество появлений. Найти персонажей с наибольшим количеством появлений, ограничить вывод первыми 5 записями.
--      - Выборка: Имя, количество появлений; сортировка по количеству появлений по убыванию, ограничить вывод первыми 5 записями.
--      - Количество строк: 5 (Человек Паук, Капитан Америка, Росомаха, Железный человек, Тор)

SELECT name, appearances
FROM MarvelCharacters
ORDER BY appearances DESC
LIMIT 5;

-- 11. Персонажи, появившиеся только в одном десятилетии
--      - Описание: Вывести имя и год первого появления. Выбрать персонажей, год первого появления которых начинается с 2000 и не превышает 2009.
--      - Выборка: Имя, год первого появления; где год первого появления между 2000 и 2009.
--      - Количество строк: 3086

SELECT name, Year
FROM MarvelCharacters
WHERE Year BETWEEN '2000' AND '2009';


-- 12. Персонажи с самыми редкими цветами глаз
--      - Описание: Вывести имя и цвет глаз. Найти персонажей с цветом глаз Magenta, Pink, или Violet.
--      - Выборка: Имя, цвет глаз; где цвет глаз Magenta, Pink, или Violet.
--      - Количество строк: 34

SELECT name, eye
FROM MarvelCharacters
WHERE eye IN ('Magenta Eyes', 'Pink Eyes', 'Violet Eyes');


-- 13. Герои с публичной идентичностью, сортированные по году
--      - Описание: Вывести имя, идентификацию, и год первого появления. Выбрать героев с публичной идентичностью (Public Identity), сортировка по году появления по возрастанию.
--      - Выборка: Имя, идентификация, год первого появления; где идентификация — Public Identity, сортировка по году появления по возрастанию.
--      - Количество строк: 4528

SELECT name, identify, Year
FROM MarvelCharacters
WHERE identify = 'Public Identity'
ORDER BY Year ASC;


-- 14. Персонажи с конкретным цветом волос и глаз, упорядоченные по имени
--      - Описание: Вывести имя, цвет волос, и цвет глаз. Выбрать персонажей с цветом волос Black и цветом глаз Green, результаты упорядочить по имени в алфавитном порядке.
--      - Выборка: Имя, цвет волос, цвет глаз; где цвет волос — Black и цвет глаз — Green, сортировка по имени.
--      - Количество строк: 99

SELECT name, hair, eye
FROM MarvelCharacters
WHERE hair = 'Black Hair' AND eye = 'Green Eyes'
ORDER BY name ASC;

-- 15. Злодеи с нестандартными физическими характеристиками
--      - Описание: Вывести имя и описание пола. Найти злодеев, у которых пол не является стандартным (не Male, не Female).
--      - Выборка: Имя, описание пола; где align — Bad Characters и пол не Male и не Female.
--      - Количество строк: 20

SELECT name, align
FROM MarvelCharacters
WHERE sex NOT IN ('Male Characters', 'Female Characters') AND align = 'Bad Characters';


-- 16. Название: Персонажи с наибольшим числом появлений по полу
--      - Описание: Определить персонажей мужского и женского пола (SEX) с наибольшим количеством появлений. Вывести имена и количество появлений для топ-1 мужского и женского пола.
--      - Выборка: Группировка по полу, определение персонажа с максимальным количеством появлений в каждой группе.
--      - Количество строк: 2

SELECT sex, name, appearances
FROM MarvelCharacters
GROUP BY sex, name, appearances
ORDER BY appearances DESC
LIMIT 2;


-- 17. Название: Сравнение популярности персонажей по цвету волос и глаз
--      - Описание: Сравнение общего количества появлений персонажей в зависимости от комбинации цвета волос и глаз. Необходимо сгруппировать данные по этим двум признакам и подсчитать общее количество появлений для каждой комбинации.
--      - Выборка: Группировка по цвету волос и глаз, подсчет количества появлений для каждой комбинации. Используйте SUM для подсчета общего количества появлений.
--      - Количество строк: 196

SELECT hair, eye, SUM(appearances) AS total_appearances
FROM MarvelCharacters
WHERE hair IS NOT NULL AND eye IS NOT NULL AND appearances IS NOT NULL
GROUP BY hair, eye;

-- 18. Название: Персонажи с максимальным количеством появлений в десятилетие
--      - Описание: Найти персонажа с максимальным количеством появлений в каждом десятилетии начиная с 1940-х. Вывести десятилетие, имя персонажа и количество появлений.
--      - Выборка: Группировка по десятилетиям (используя год), определение персонажа с максимальным количеством появлений в каждом десятилетии.
--      - Количество строк: 9

SELECT 
    name,
    MAX(appearances), decade
FROM 
    (SELECT name, appearances, (year / 10 ) * 10 AS decade
    FROM MarvelCharacters WHERE year IS NOT NULL AND appearances IS NOT NULL)
GROUP BY decade
ORDER BY decade DESC;


-- 19. Название: Герои и злодеи 80-х
--      - Описание: Сравнение количества новых героев и злодеев, появившихся в 1980-х. Необходимо сгруппировать данные по мировозрению (ALIGN) как Good и Bad, фильтровать по годам появления между 1980 и 1989 годами и подсчитать количество новых персонажей в каждой категории.
--      - Выборка: Группировка по ALIGN, фильтрация по годам между 1980 и 1989, подсчет количества новых персонажей.
--      - Количество строк: 20

SELECT align, year, COUNT(*) AS new_characters
FROM MarvelCharacters
WHERE align IN ('Good Characters','Bad Characters') AND year BETWEEN 1980 AND 1989
GROUP BY align, Year;


-- 20. Название: Самые популярные прически супергероев
--      - Описание: Определение трех самых популярных причесок среди супергероев по общему количеству появлений. Группировать данные по типу прически и подсчитать общее количество появлений, выбрать топ-3.
--      - Выборка: Группировка по прическе, подсчет суммы появлений для каждой прически, выбор топ-3 по количеству появлений.
--      - Количество строк: 3

SELECT hair, SUM(appearances) AS total_appearances
FROM MarvelCharacters
WHERE hair IS NOT NULL AND appearances IS NOT NULL
GROUP BY hair
ORDER BY total_appearances DESC
LIMIT 3;


