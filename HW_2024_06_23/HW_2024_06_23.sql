**Задание 1: Общее количество персонажей по статусу**
- **Описание:** Подсчитайте количество персонажей в зависимости от их статуса (живые или умершие). Выведите статус персонажа и количество персонажей в каждом статусе.
- **Выборка столбцов:** status, count(id)
- **Условия отбора:** Группировка по статусу персонажа.
- **Результат строк:** 

SELECT
    living_status.status AS status,
    COUNT(marvel_characters.id) AS count
FROM
    marvel_characters
    INNER JOIN
        living_status ON marvel_characters.alive_id = living_status.status_id
GROUP BY
    living_status.status;

**Задание 2: Среднее количество появлений персонажей с разным цветом глаз**
- **Описание:** Найдите среднее количество появлений персонажей для каждого цвета глаз. Выведите цвет глаз и среднее количество появлений персонажей с этим цветом глаз.
- **Выборка столбцов:** color, avg(APPEARANCES)
- **Условия отбора:** Группировка по цвету глаз.
- **Результат строк:**

SELECT
    eye_color.color AS eye_color,
    ROUND(AVG(marvel_characters.appearances), 0) AS avg_appearances
FROM
    marvel_characters
    INNER JOIN
        eye_color ON marvel_characters.eye_id = eye_color.eye_id
GROUP BY
    eye_color.color;

**Задание 3: Максимальное количество появлений у персонажей с определенным цветом волос**
- **Описание:** Определите максимальное количество появлений персонажей для каждого цвета волос. Выведите цвет волос и максимальное количество появлений персонажей с этим цветом волос.
- **Выборка столбцов:** color, max(APPEARANCES)
- **Условия отбора:** Группировка по цвету волос.
- **Результат строк:** 

SELECT
    hair_color.color AS hair_color,
    MAX(marvel_characters.appearances) AS max_appearances
FROM
    marvel_characters
    INNER JOIN
        hair_color ON marvel_characters.hair_id = hair_color.hair_id
GROUP BY
    hair_color.color;

**Задание 4: Минимальное количество появлений среди персонажей с известной и публичной личностью**
- **Описание:** Найдите минимальное количество появлений персонажей с "Public Identity". Выведите тип личности и минимальное количество появлений персонажей с этим типом личности.
- **Выборка столбцов:** identity, min(APPEARANCES)
- **Условия отбора:** Группировка по типу личности, где тип личности - "Public Identity".
- **Результат строк:** 

SELECT identity.identity AS 'Тип личности', MIN(appearances) AS 'Минимальное количество появлений'
FROM marvel_characters
JOIN identity ON identity.identity_id = marvel_characters.identity_id
WHERE identity.identity = 'Public Identity'
GROUP BY identity.identity;

**Задание 5: Общее количество персонажей по полу**
- **Описание:** Подсчитайте количество персонажей для каждого пола. Выведите пол персонажа и количество персонажей каждого пола.
- **Выборка столбцов:** name, count(id)
- **Условия отбора:** Группировка по полу персонажа.
- **Результат строк:** 

SELECT sex.name AS 'Пол', COUNT(marvel_characters.id) AS 'Количество персонажей'
FROM marvel_characters
JOIN sex ON sex.sex_id = marvel_characters.sex_id
GROUP BY sex.name;

**Задание 6: Средний год первого появления персонажей с различным типом личности**
- **Описание:** Найдите средний год первого появления для каждого типа личности. Выведите тип личности и средний год первого появления персонажей с этим типом личности.
- **Выборка столбцов:** identity, avg(Year)
- **Условия отбора:** Группировка по типу личности.
- **Результат строк:** 

SELECT identity.identity AS 'Тип личности', AVG(year) AS 'Год первого появления'
FROM marvel_characters
JOIN identity ON identity.identity_id = marvel_characters.identity_id
GROUP BY identity.identity;

**Задание 7: Количество персонажей с разным цветом глаз среди живых**
- **Описание:** Подсчитайте количество живых персонажей для каждого цвета глаз. Выведите цвет глаз и количество живых персонажей с этим цветом глаз.
- **Выборка столбцов:** color, count(id)
- **Условия отбора:** Группировка по цвету глаз, учитывая только живых персонажей.
- **Результат строк:** 

SELECT eye_color.color AS 'Цвет глаз', COUNT(marvel_characters.id) AS "Количество живых персонажей"
FROM marvel_characters
JOIN eye_color ON eye_color.eye_id = marvel_characters.eye_id
JOIN living_status ON living_status.status_id = marvel_characters.alive_id
WHERE living_status.status = 'Living Characters'
GROUP BY eye_color.color;

**Задание 8: Максимальное и минимальное количество появлений среди персонажей с определенным цветом волос**
- **Описание:** Определите максимальное и минимальное количество появлений персонажей для каждого цвета волос. Выведите цвет волос, максимальное и минимальное количество появлений персонажей с этим цветом волос.
- **Выборка столбцов:** color, max(APPEARANCES), min(APPEARANCES)
- **Условия отбора:** Группировка по цвету волос.
- **Результат строк:** 
SELECT
    hair_color.color AS color,
    MAX(marvel_characters.appearances) AS max_appearances,
    MIN(marvel_characters.appearances) AS min_appearances
FROM
    marvel_characters
    INNER JOIN
        hair_color ON marvel_characters.hair_id = hair_color.hair_id
GROUP BY
    hair_color.hair_id;

**Задание 9: Количество персонажей с различным типом личности среди умерших**
- **Описание:** Подсчитайте количество умерших персонажей для каждого типа личности. Выведите тип личности и количество умерших персонажей с этим типом личности.
- **Выборка столбцов:** identity, count(id)
- **Условия отбора:** Группировка по типу личности, учитывая только умерших персонажей.
- **Результат строк:** 

SELECT identity.identity AS 'Тип личности', COUNT(marvel_characters.id) AS 'Количество умерших персонажей'
FROM marvel_characters
JOIN identity ON identity.identity_id = marvel_characters.identity_id
JOIN living_status ON living_status.status_id = marvel_characters.alive_id
WHERE living_status.status = 'Deceased Characters'
GROUP BY identity.identity;

**Задание 10: Средний год первого появления персонажей с различным цветом глаз**
- **Описание:** Найдите средний год первого появления для каждого цвета глаз. Выведите цвет глаз и средний год первого появления персонажей с этим цветом глаз.
- **Выборка столбцов:** color, avg(Year)
- **Условия отбора:** Группировка по цвету глаз.
- **Результат строк:** 

SELECT eye_color.color AS 'Цвет глаз', AVG(year) AS 'Год первого появления'
FROM marvel_characters
JOIN eye_color ON eye_color.eye_id = marvel_characters.eye_id
GROUP BY eye_color.color;

#### Подзапросы

**Задание 11: Персонаж с наибольшим количеством появлений**
- **Описание:** Найдите персонажа, у которого наибольшее количество появлений. Количество появлений должно быть равно максимальному количеству появлений среди всех персонажей.
- **Выборка столбцов:** name, APPEARANCES
- **Условия отбора:** Количество появлений должно быть равно максимальному количеству появлений среди всех персонажей.
- **Результат строк:** 

SELECT marvel_characters.name, marvel_characters.year
FROM marvel_characters
WHERE appearances = (SELECT MAX(appearances) FROM marvel_characters)


**Задание 12: Персонажи, впервые появившиеся в том же году, что и персонаж с максимальными появлениями**
- **Описание:** Найдите всех персонажей, которые впервые появились в том же году, что и персонаж с максимальными появлениями. Год первого появления должен совпадать с годом первого появления персонажа с максимальными появлениями.
- **Выборка столбцов:** name, Year
- **Условия отбора:** Год первого появления должен совпадать с годом первого появления персонажа с максимальными появлениями.
- **Результат строк:** 

WITH max_appearances_character AS (
    SELECT
        name,
        year
    FROM
        marvel_characters
    WHERE
        appearances = (SELECT MAX(appearances) FROM marvel_characters)
)
SELECT
    marvel_characters.name,
    marvel_characters.year
FROM
    marvel_characters
        INNER JOIN
            max_appearances_character ON marvel_characters.year = max_appearances_character.year;

-- можно через поздапрос
SELECT
    name,
    year
FROM
    marvel_characters
WHERE year = (SELECT year 
              FROM marvel_characters 
              WHERE appearances = (SELECT MAX(appearances) 
                                   FROM marvel_characters))

**Задание 13: Персонажи с наименьшим количеством появлений среди живых**
- **Описание:** Найдите всех живых персонажей, у которых наименьшее количество появлений. Количество появлений должно быть равно минимальному количеству появлений среди живых персонажей.
- **Выборка столбцов:** name, APPEARANCES
- **Условия отбора:** Количество появлений должно быть равно минимальному количеству появлений среди живых персонажей.

SELECT marvel_characters.name, marvel_characters.year
FROM marvel_characters
JOIN living_status ON living_status.status_id = marvel_characters.alive_id
WHERE living_status.status = 'Living Characters'
AND appearances = (SELECT MIN(appearances) FROM marvel_characters)


**Задание 14: Персонажи с определенным цветом волос и максимальными появлениями среди такого цвета**
- **Описание:** Найдите персонажей с определенным цветом волос, у которых максимальное количество появлений среди всех персонажей с таким цветом волос. Цвет волос должен совпадать с заданным, количество появлений должно быть равно максимальному количеству появлений среди всех персонажей с таким цветом волос.
- **Выборка столбцов:** name, color, APPEARANCES
- **Условия отбора:** Цвет волос должен совпадать с заданным, количество появлений должно быть равно максимальному количеству появлений среди всех персонажей с таким цветом волос.

SELECT marvel_characters.name, hair_color.color, marvel_characters.appearances
FROM marvel_characters
JOIN hair_color ON hair_color.hair_id = marvel_characters.hair_id
AND marvel_characters.appearances = (
    SELECT MAX(appearances)
    FROM marvel_characters AS color_select
    WHERE color_select.hair_id = marvel_characters.hair_id
);

**Задание 15: Персонажи с публичной личностью и наименьшим количеством появлений**
- **Описание:** Найдите всех персонажей с "Public Identity", у которых наименьшее количество появлений. Тип личности должен быть "Public Identity", количество появлений должно быть равно минимальному количеству появлений среди всех персонажей с такой личностью.
- **Выборка столбцов:** name, identity, APPEARANCES
- **Условия отбора:** Тип личности должен быть "Public Identity", количество появлений должно быть равно минимальному количеству появлений среди всех персонажей с такой личностью.

SELECT marvel_characters.name, identity.identity, marvel_characters.appearances
FROM marvel_characters
JOIN identity ON identity.identity_id = marvel_characters.identity_id
JOIN living_status ON living_status.status_id = marvel_characters.alive_id
WHERE identity.identity = 'Public Identity'
AND living_status.status = 'Living Characters'
AND appearances = (SELECT MIN(appearances) FROM marvel_characters);

#### Операции обновления, добавления и удаления данных

**Задание 16: Обновление статуса персонажей**
- **Описание:** Обновите статус всех персонажей, которые умерли, на "Living Characters". Статус персонажей должен быть "Deceased Characters".
- **Условия отбора:** Статус персонажей должен быть "Deceased Characters".
- **Действие:** Обновить статус на "Living Characters".

UPDATE marvel_characters
SET alive_id = (SELECT status_id FROM living_status WHERE status = 'Living Characters')
WHERE alive_id = (SELECT status_id FROM living_status WHERE status = 'Deceased Characters');


**Задание 17: Добавление нового персонажа**
- **Описание:** Добавьте нового персонажа в базу данных. Укажите все необходимые поля. Новый персонаж должен иметь уникальное имя и urlslug. Укажите соответствующие значения для всех других полей.
- **Условия отбора:** Новый персонаж должен иметь уникальное имя и urlslug. Укажите соответствующие значения для всех других полей.
- **Действие:** Добавить нового персонажа.

INSERT INTO marvel_characters (
    page_id,
    name,
    urlslug,
    identity_id,
    align_id,
    eye_id,
    hair_id,
    sex_id,
    gsm_id,
    alive_id,
    appearances,
    first_appearance,
    year
)
VALUES (
    '1',
    'New Super Hero',
    'New_Super_Hero_(Earth-616)',
    '1',
    '1',
    '1',
    '1',
    '1',
    '1',
    '1',
    '1',
    'May-33',
    '2033'
);

**Задание 18: Удаление персонажей с нулевыми появлениями**
- **Описание:** Удалите всех персонажей, у которых количество появлений равно нулю. Количество появлений должно быть равно нулю.
- **Условия отбора:** Количество появлений должно быть равно нулю.
- **Действие:** Удалить персонажей.

DELETE FROM marvel_characters
WHERE appearances = 0;

**Задание 19: Обновление цвета волос персонажей**
- **Описание:** Обновите цвет волос всех персонажей с "Strawberry
 Blond Hair" на "Blond Hair". Цвет волос персонажей должен быть "Strawberry Blond Hair".
- **Условия отбора:** Цвет волос персонажей должен быть "Strawberry Blond Hair".
- **Действие:** Обновить цвет волос на "Blond Hair".

UPDATE marvel_characters
SET hair_id = (SELECT hair_id FROM hair_color WHERE color = 'Blond Hair')
WHERE hair_id = (SELECT hair_id FROM hair_color WHERE color = 'Strawberry Blond Hair');

**Задание 20: Добавление нового статуса**
- **Описание:** Добавьте новый статус "Unknown Status" в таблицу статусов. Новый статус должен быть уникальным.
- **Условия отбора:** Новый статус должен быть уникальным.
- **Действие:** Добавить новый статус.

INSERT INTO living_status (status_id, status) VALUES (3, 'Unknown Status');
