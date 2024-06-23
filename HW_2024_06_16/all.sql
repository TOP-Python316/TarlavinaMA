### Исходная Таблица

#### Шаг 1: Создание таблицы `MarvelCharacters`

- `page_id`: INTEGER - целочисленный идентификатор страницы.
- `name`: TEXT - текстовое название персонажа.
- `urlslug`: TEXT - текстовый идентификатор URL.
- `identify`: TEXT - текстовая идентификация персонажа.
- `ALIGN`: TEXT - текстовое значение выравнивания персонажа.
- `EYE`: TEXT - текстовое значение цвета глаз.
- `HAIR`: TEXT - текстовое значение цвета волос.
- `SEX`: TEXT - текстовое значение пола персонажа.
- `GSM`: TEXT - не уточнено, предположительно текстовое поле.
- `ALIVE`: TEXT - текстовое значение статуса живой/мертвый.
- `APPEARANCES`: INTEGER - целочисленное значение количества появлений.
- `FIRST_APPEARANCE`: TEXT - текстовое значение первого появления.
- `Year`: INTEGER - целочисленное значение года.

CREATE TABLE MarvelCharacters (
  page_id INTEGER,
  name TEXT,
  urlslug TEXT,
  identify TEXT,
  ALIGN TEXT,
  EYE TEXT,
  HAIR TEXT,
  SEX TEXT,
  GSM TEXT,
  ALIVE TEXT,
  APPEARANCES INTEGER,
  FIRST_APPEARANCE TEXT,
  Year INTEGER
);

### Промежуточная Таблица

#### Шаг 2: Создание таблицы `MarvelCharacters_new`

- `id`: INTEGER PRIMARY KEY AUTOINCREMENT - уникальный идентификатор.
- Остальные поля аналогичны исходной таблице `MarvelCharacters`.

CREATE TABLE MarvelCharacters_new (
    id               INTEGER PRIMARY KEY AUTOINCREMENT,
    page_id          INTEGER,
    name             TEXT,
    urlslug          TEXT,
    identity         TEXT,
    align            TEXT,
    eye              TEXT,
    hair             TEXT,
    sex              TEXT,
    GSM              TEXT,
    alive            TEXT,
    appearances      INTEGER,
    first_appearance TEXT,
    year             INTEGER
);

### Нормализованные Таблицы

#### Шаг 5: Создание таблиц для уникальных значений

1. `Sex`

   - `sex_id`: INTEGER PRIMARY KEY AUTOINCREMENT - уникальный идентификатор пола.
   - `name`: TEXT UNIQUE - название пола.

2. `EyeColor`

   - `eye_id`: INTEGER PRIMARY KEY AUTOINCREMENT - уникальный идентификатор цвета глаз.
   - `color`: TEXT UNIQUE - название цвета.

3. `HairColor`

   - `hair_id`: INTEGER PRIMARY KEY AUTOINCREMENT - уникальный идентификатор цвета волос.
   - `color`: TEXT UNIQUE - название цвета.

4. `Alignment`

   - `align_id`: INTEGER PRIMARY KEY AUTOINCREMENT - уникальный идентификатор выравнивания.
   - `name`: TEXT UNIQUE - название выравнивания.

5. `LivingStatus`

   - `status_id`: INTEGER PRIMARY KEY AUTOINCREMENT - уникальный идентификатор статуса живой/мертвый.
   - `status`: TEXT UNIQUE - статус.

6. `Identity`
   - `identity_id`: INTEGER PRIMARY KEY AUTOINCREMENT - уникальный идентификатор идентификации.
   - `identity`: TEXT UNIQUE - идентификация.


 CREATE TABLE Sex (
    sex_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT UNIQUE
);

CREATE TABLE EyeColor (
    eye_id INTEGER PRIMARY KEY AUTOINCREMENT,
    color TEXT UNIQUE
);

CREATE TABLE HairColor (
    hair_id INTEGER PRIMARY KEY AUTOINCREMENT,
    color TEXT UNIQUE
);

CREATE TABLE Alignment (
    align_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT UNIQUE
);

CREATE TABLE LivingStatus (
    status_id INTEGER PRIMARY KEY AUTOINCREMENT,
    status TEXT UNIQUE
);

CREATE TABLE Identity (
    identity_id INTEGER PRIMARY KEY AUTOINCREMENT,
    identity TEXT UNIQUE
);  

#### Шаг 7: Создание таблицы `MarvelCharacters_New` с внешними ключами

- `id`: INTEGER PRIMARY KEY AUTOINCREMENT - уникальный идентификатор.
- `page_id`: INTEGER - идентификатор страницы.
- `name`: TEXT - название персонажа.
- `urlslug`: TEXT - идентификатор URL.
- `identity_id`: INTEGER - внешний ключ к `Identity`.
- `align_id`: INTEGER - внешний ключ к `Alignment`.
- `eye_id`: INTEGER - внешний ключ к `EyeColor`.
- `hair_id`: INTEGER - внешний ключ к `HairColor`.
- `sex_id`: INTEGER - внешний ключ к `Sex`.
- `status_id`: INTEGER - внешний ключ к `LivingStatus`.
- `APPEARANCES`: INTEGER - количество появлений.
- `FIRST_APPEARANCE`: TEXT - первое появление.
- `Year`: INTEGER - год.


CREATE TABLE IF NOT EXISTS marvel_characters_temp (
    id               INTEGER PRIMARY KEY AUTOINCREMENT,
    page_id          INTEGER,
    name             TEXT,
    urlslug          TEXT,
    identity_id      TEXT,
    align_id         TEXT,
    eye_id           TEXT,
    hair_id          TEXT,
    sex_id           TEXT,
    status_id        TEXT,
    APPEARANCES      INTEGER,
    FIRST_APPEARANCE TEXT,
    Year             INTEGER,

    FOREIGN KEY (identity_id) REFERENCES Identity (identity_id),
    FOREIGN KEY (align_id) REFERENCES Alignment (align_id),
    FOREIGN KEY (eye_id) REFERENCES EyeColor (eye_id),
    FOREIGN KEY (hair_id) REFERENCES HairColor (hair_id),
    FOREIGN KEY (sex_id) REFERENCES Sex (sex_id),
    FOREIGN KEY (status_id) REFERENCES LivingStatus (status_id)
);

### Финальная Таблица

#### Шаг 10: Переименование `MarvelCharacters_New` в `MarvelCharacters`

ALTER TABLE MarvelCharacters_New RENAME TO MarvelCharacters;