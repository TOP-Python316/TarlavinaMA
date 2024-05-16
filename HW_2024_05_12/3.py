# Для игры стратегии необходимо создать абстрактный класс Unit.
# Каждый юнит должен уметь двигаться, защищаться и атаковать,
# поэтому Unit имеет три абстрактных метода: move(), attack() и defend().

# Два конкретных класса, Infantry (пехота) и Cavalry (кавалерия), будут наследовать и реализовывать эти методы.
#   метод move в классе Infantry должен печатать сообщение "Пехота передвигается в пешем порядке",
#   метод attack в классе Infantry должен печатать сообщение "Пехота участвует в ближнем бою",
#   метод defend в классе Infantry должен печатать сообщение "Пехота держит строй",
#   метод move в классе Cavalry должен печатать сообщение "Кавалерия передвигается верхом".
#   метод attack в классе Cavalry должен печатать сообщение "Кавалерия переходит в атаку".
#   метод defend в классе Cavalry должен печатать сообщение "Кавалерия защищает фланги".

# В игре также должен быть класс Squad, который будет добавлять юнит в армию и выполнять операции атаки и защиты.
#   метод add_unit в классе Squad должен добавлять солдата в армию.
#   метод attack в классе Squad должен вызывать метод move() и attack() для каждого юнита в армии.
#   метод defend в классе Squad должен вызывать метод move() и defend() для каждого юнита в армии.

# Чтобы гарантировать, что используются только экземпляры класса Unit,
# нужно создать декоратор validate_unit, который будет проверять тип объекта.

# Если объект не является экземпляром класса Unit, декоратор выдаст ошибку TypeError.
# Декоратор будет применяться к методам move(), attack() и defend() классов Infantry и Cavalry.


from abc import ABC, abstractmethod


# Декоратор для проверки типа объекта
def validate_unit(func):
    def wrapper(self, *args, **kwargs):
        if not isinstance(self, Unit):
            raise TypeError("This method can be used only with Unit instances")
        return func(self, *args, **kwargs)

    return wrapper


class Unit:  # Абстрактный класс Unit

    @abstractmethod
    def move(self):
        pass

    @abstractmethod
    def attack(self):
        pass

    @abstractmethod
    def defend(self):
        pass


class Infantry(Unit):  # Класс пехоты
    @validate_unit
    def move(self):
        print("Пехота передвигается в пешем порядке")

    @validate_unit
    def attack(self):
        print("Пехота участвует в ближнем бою")

    @validate_unit
    def defend(self):
        print("Пехота держит строй")


# Класс кавалерии
class Cavalry(Unit):
    @validate_unit
    def move(self):
        print("Кавалерия передвигается верхом")

    @validate_unit
    def attack(self):
        print("Кавалерия переходит в атаку")

    @validate_unit
    def defend(self):
        print("Кавалерия защищает фланги")


class Squad:  # Класс армии
    def __init__(self):
        self.units = []

    def add_unit(self, unit):
        self.units.append(unit)

    def attack(self):
        for unit in self.units:
            unit.move()
            unit.attack()

    def defend(self):
        for unit in self.units:
            unit.move()
            unit.defend()


# пример работы, изменила название переменной
Squad = Squad()
Squad.add_unit(Infantry())
Squad.add_unit(Cavalry())
Squad.add_unit(Infantry())
Squad.add_unit(Cavalry())

Squad.attack()
print("\n")
Squad.defend()


# Пехота передвигается в пешем порядке
# Пехота участвует в ближнем бою
# Кавалерия передвигается верхом
# Кавалерия переходит в атаку
# Пехота передвигается в пешем порядке
# Пехота участвует в ближнем бою
# Кавалерия передвигается верхом
# Кавалерия переходит в атаку

# Пехота передвигается в пешем порядке
# Пехота держит строй
# Кавалерия передвигается верхом
# Кавалерия защищает фланги
# Пехота передвигается в пешем порядке
# Пехота держит строй
# Кавалерия передвигается верхом
# Кавалерия защищает фланги
