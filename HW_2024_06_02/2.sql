-- 2. Вывести столбцы name, year, eye из таблицы MarvelCharacters с условием, что персонажи женского пола и появлением после 1990 года [2112 записей]

SELECT name, year, eye
FROM MarvelCharacters
WHERE sex = 'Female Characters' AND year > 1990;