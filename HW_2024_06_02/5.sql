-- 5. Выведите имена персонажей у которых не заполнены поля, identify, align, eye, hair, sex, GSM, alive, appearances, year [3 записи]

SELECT name
FROM MarvelCharacters
WHERE 
identify IS NULL 
AND align IS NULL 
AND eye IS NULL 
AND hair IS NULL 
AND sex IS NULL 
AND GSM IS NULL 
AND alive IS NULL 
AND appearances IS NULL 
AND year IS NULL