-- 1. Вывести столбцы name, year, hair из таблицы MarvelCharacters с условием, что персонажи мужского пола и с появлением до 1990 года [5914 записей]

SELECT name, year, hair
FROM MarvelCharacters
WHERE sex = 'Male Characters' AND year < 1990;
