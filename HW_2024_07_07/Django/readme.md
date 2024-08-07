# Django_316 - Учебный проект "Карточки интервального повторения"
## Lesson 45

### Создали проект Django_316

1. Создали репозиторий
2. Создали проект Django_316
3. Установили зависимости `pip install django==4.2`
4. Сохранили зависимости в файл `reqirements.txt` командой `pip freeze > requirements.txt`

Развернуть проект на локальной машине:
 - Склонировать репозиторий командой `git clone git@github.com:TOP-Python316/django_316.git`
 - Перейти в папку проекта `cd django_316`
 - Создать виртуальное окружение `python -m venv venv`
 - Активировать виртуальное окружение `source venv/bin/activate`
 - Установить зависимости `pip install -r requirements.txt`

### Создание Django project

1. Создать проект `django-admin startproject anki .`
Этой командой мы создадим проект с именем `anki` в текущей директории.
Точка в конце команды означает, что проект будет создан в текущей директории, 
без создания дополнительной директории с именем проекта.

2. Запуск проекта `python manage.py runserver`
Для запуска проекта, вам нужно использовать терминал, и находясь в директории проекта, на одном уровне с файлом `manage.py`, выполнить команду `python manage.py runserver`
Для остановки сервера используйте комбинацию клавиш `Ctrl+C`

**Команды терминала:**
- `python manage.py runserver` - запуск сервера
- `cd` - смена директории
- `cd..` - переход на уровень выше
- `ls` - просмотр содержимого директории
- `pwd` - показать текущую директорию

3. Создание приложения `python manage.py startapp cards`
После создания приложения, вам нужно зарегистрировать его в файле `settings.py` в разделе `INSTALLED_APPS`
Без этого, полноценно, приложение не будет работать.

### Создали первое представление

```python
from django.http import HttpResponse

def main(request):
    return HttpResponse("Hello, world!")  # вернет страничку с надписью "Hello, world!" на русском языке.

```

Чтобы представление заработало, его нужно зарегистрировать в файле `urls.py` конфигурации проекта.

### Создали первый URL

```python
path('', views.main),
```

Теперь, если вы перейдете на главную страницу сайта, то увидите надпись "Hello, world!"

### Создаем детальное представление карточки по ее ID

Для этого нам нужно создать новый маршрут, с конвертом int, который будет принимать ID карточки.

```python
path('cards/<int:card_id>/', views.card_detail),
```

А так же функцию, которая будет обрабатывать запрос и возвращать страницу с детальной информацией о карточке.

```python
def card_by_id(request, card_id):
    return HttpResponse(f"Карточка с ID {card_id}")
```

### `include` и собственный файл `urls.py` для приложения `cards`

1. Создали еще одно представление `get_all_cards` в файле `views.py`
2. Создали файл `urls.py` в директории приложения `cards`
3. Зарегистрировали новый файл `urls.py` в файле `urls.py` конфигурации проекта с помощью функции `include`
4. Зарегистрировали маршруты без префикса `cards/` в файле `urls.py` приложения `cards`
5. Удалили маршруты `cards/` из файла `urls.py` конфигурации проекта


## Lesson 46

### Знакомство с Django Templates (Шаблоны)

1. Создали папку `templates` в директории приложения `cards`
2. Создали файл `catalog.html` в директории `templates/cards`
3. Переписали функцию `get_all_cards` в файле `views.py` так, чтобы она возвращала страницу `catalog.html`
используя функцию `render` из модуля `django.shortcuts`

**commit: `lesson_46: рендер первого шаблона`**

### Работа с шаблоном 
1. Создали словарь с данными в `views.py` и передали его в шаблон
```python
info = {
    "users_count": 100600,
    "cards_count": 100600,
}
```
2. Вставили данные в шаблон `catalog.html` с помощью шаблонного языка Django
3. Подключили BS5 по CDN и стилизовали страницу

**commit: `lesson_46: передал первые данные в шаблон и подключил BS5`**

### Смотрим типы данных внутри шаблона
- Проверили, что можем передать экземпляр класса, и вывести его атрибуты в шаблоне
- Проверили, что можно передать только словарь
- Передали список и вывели его в шаблоне
- Передали список меню и познакомились с конструкцией `{% for item in menu %}`

**commit: `lesson_46: первый цикл в шаблоне`**

### Посмотрели на тег шаблона `if`
- Сделали `<hr>` после каждого элемента списка, кроме последнего

**commit: `lesson_46: первый тег if в шаблоне`**

### Сделали ссылки в меню кликабельными
- Передали в шаблон список словарей, где каждый словарь содержит url и title
- Осталось протестировать шаблонный тег `url`!

**commit: `lesson_46: сделал ссылки в меню кликабельными`**


## Lesson 47

### Настройка конфигурации запуска в PyCharm

1. **Откройте "Edit Configurations"**: В PyCharm перейдите в меню "Run" -> "Edit Configurations" для настройки новой конфигурации запуска.
2. **Добавление новой конфигурации**: Нажмите на плюсик (+) и выберите тип конфигурации для Python.
3. **Заполнение полей конфигурации**:
   - **Название**: Дайте конфигурации понятное имя, чтобы вы могли легко идентифицировать её среди других конфигураций.
   - **Рабочая директория**: Укажите директорию вашего проекта Django. Это папка, где находится файл `manage.py`.
   - **Интерпретатор языка**: Выберите интерпретатор Python для вашего виртуального окружения, если вы его используете, или глобальный интерпретатор, если виртуальное окружение не настроено.
   - **Script path**: Укажите путь к файлу `manage.py` в вашем проекте Django.
   - **Параметры**: Введите `runserver`, чтобы запустить разработческий сервер Django.

**commit: `lesson_47: настроили запуск django-сервера по кнопке`**

### Сделали практику
- Описали маршруты /catalog, catalog/<int:card_id/>, catalog/<slug:slug> и создали соответствующие представления в файле views.py
- catalog возвращает HttpResponse("Каталог карточек")
- get_card_by_id возвращает HttpResponse(f"Карточка {card_id}")
- get_category_by_name возвращает HttpResponse(f"Карточка {slug}")

**commit: `lesson_47: добавили новые маршруты`**

### Изменение структуры `cards/url.py` и `cards/views.py`
Изменил пути и функции для дальнейшего развития проекта.

**commit: `lesson_47: изменение структуры путей`**

### Создание базового шаблона `base.html` в корне проекта в папке `templates`
- Создали базовый шаблон `base.html` в папке `templates`
- Указали кастомный, нестандартный путь для Джанго в файле `settings.py` в разделе `TEMPLATES` 
- Прописали там `BASE_DIR / 'templates',`
- Подключили базовый шаблон для теста функции `main` в файле `views.py`

**commit: `lesson_47: создали базовый шаблон base.html`**

### Синтаксис блоков в шаблонах. `{% block %}` и `{% extends %}`

- Описали блок `content` в базовом шаблоне `base.html`
- Создали шаблон `main.html` в папке `templates`, который расширяет базовый шаблон через `{% extends %}`
- Переопределили блок `content` в шаблоне `main.html` через `{% block %}`
- Подключили шаблон `main.html` в функции `main` в файле `views.py`

**commit: `lesson_47: создали шаблон main.html и расширили базовый шаблон`**

### Создание шаблона `nav_menu.html` и подключение его в базовом шаблоне через `{% include %}`
- Создали каталог `includes` в папке `templates` в корне проекта
- Создали шаблон `nav_menu.html` в папке `includes`
- Написали навигационное меню в шаблоне `nav_menu.html`
- Использовали шаблонный тег `{% url %}` который позволяет создавать ссылки на страницы по их именам в файле `urls.py`
- Подключили шаблон `nav_menu.html` в базовом шаблоне `base.html` через `{% include %}`
- Добавили датасет с карточками и меню, чтобы проверить работу шаблона

**commit: `lesson_47: создали шаблон nav_menu.html и подключили его в базовом шаблоне`**


## Lesson 48

### Работа с шаблонами `about.html`, `catalog.html`, `main.html` а так же модификация `views.py`
- Модифицировали все шаблоны, и сделали так, чтобы они наследовались от базового шаблона
- Модфицировали соответствующие функции в файле `views.py`, чтобы они возвращали нужные шаблоны и принимали данные для меню
- Наладили рендер меню во всех шаблонах, и получили "сквозное" меню на всех страницах

**commit: `lesson_48: модифицировалb все шаблоны и функции в views.py — сквозная навигация`**

### Начали работу над каталогом карточек (динамическая вставка данных в шаблон, цикл + `include`)
- Создали `includes` в папке `templates` в приложении `cards`
- Внутри создали шаблон `card_preview.html`
- Шаблон `card_preview.html` принимает на вход словарь с данными о карточке и возвращает карточку,
которая будет вставлена в каталог карточек в шаблоне `catalog.html` в цикле

**commit: `lesson_48: начали работу над каталогом карточек и динамической вставкой данных в шаблон`**

### Продолжили работу над каталогом карточек (динамическая вставка данных в шаблон, цикл + `include`)
- Добавили шаблон `card_detail.html` в папке `templates/cards` 
- Доделали `include` в шаблоне `catalog.html` и вставили в него карточки из словаря
- Обновили функцию `get_detail_card_by_id` — сделали поиск карточки по ID в словаре и возврат шаблона `card_detail.html` ИЛИ 404

**commit: `lesson_48: доделали каталог карточек и детальное отображение карточки по ID`**

### Собственные шаблонные теги через `simple_tag` и `inclusion_tag`
- Создали тег шаблона `markdown_to_html` через `simple_tag` в файле `cards/templatetags/markdown_to_html.py`
- Протестировали его в представлении `card_detail` в шаблоне `card_detail.html`

**commit: `lesson_48: создали собственный тег шаблона markdown_to_html через simple_tag`**

### Создали папку `static` в приложении `cards` и подключили статику в шаблоне `base.html`
- Создали папку `static` в приложении `cards`
- Создали папку `cards` в папке `static`
- В ней создали папку `css` и файл `main.css`, а так же папку `js` и файл `main.js`
- Создали тестовые стили и скрипт
- Подключили статику в шаблоне `base.html` через тег `{% load static %}` и тег `{% static %}`
- Подключили стили и скрипт в шаблоне `base.html`
- Проверили работу статики на всех страницах

**commit: `lesson_48: подключили статику в шаблоне base.html`**

### Работа с фильтрами в шаблонах
Посмотрели на работу следующих фильтров в шаблоне `card_preview.html`:
- `length`
- `truncatechars`
- `join`

Так же, в шаблон был добавлен цикл для вывода тегов карточки.

**commit: `lesson_48: работа с фильтрами в шаблонах`**

HOTFIX: `templatetags` перенесён в cards из `cards/templates`

**commit: `lesson_48: исправлена ошибка местонахождения templatetags`**

тестовое изменение для создания коммита

**commit: `lesson_48: тестовое изменение для создания коммита`**

тестовое изменение для создания коммита II

**commit: `lesson_48: тестовое изменение для создания коммита II`**

### Сделаем второй вариант шаблонного тега `markdown_to_html` через `inclusion_tag`
- Создали второй вариант шаблонного тега `markdown_to_html` через `inclusion_tag` в файле `cards/templatetags/markdown_to_html.py`
- Создали шаблон `markdown_to_html.html` в папке `templates/cards`
- Протестировали его в представлении `card_detail` в шаблоне `card_detail.html`
- Сравнили работу двух вариантов шаблонного тега

**commit: `lesson_48: добавление второго варианта фильтра (inclusion_tag)`**