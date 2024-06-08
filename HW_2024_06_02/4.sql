-- 4. Вывести имя и год появления всех голубоглазых блондинов 60-х и 80-х годов отсортированных по году по возрастанию [140 записей]

-- Добавте пожалуйста к описанию задачи что год между 60 и 80, и пол должен быть?

SELECT name, year
FROM MarvelCharacters
WHERE sex IS NOT NULL 
AND eye = 'Blue Eyes'
AND hair = 'Blond Hair'
AND year BETWEEN 1960 AND 1980
ORDER BY year ASC;