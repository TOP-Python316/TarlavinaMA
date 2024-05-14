# 1.
# Для ПО ресторана нужно разработать модуль, помогающий контролировать использование фруктов и овощей на кухне.
# Создайте абстрактный класс Ingredient с методами get_name() и get_quantity().
# Затем создайте два подкласса Vegetable и Fruit,
# которые наследуют абстрактные методы от Ingredient и реализуют свои собственные версии методов get_name() и get_quantity().


# Пример использования:
# carrot = Vegetable("Морковь", 5)
# apple = Fruit("Яблоки", 10)

# print(carrot.get_name())
# print(carrot.get_quantity())

# print(apple.get_name())
# print(apple.get_quantity())


# Вывод:
# Морковь
# 5 кг
# Яблоки
# 10 кг

from abc import ABC, abstractmethod


class Ingredient:
    def __init__(self, name, quantity):
        self.name = name
        self.quantity = quantity

    @abstractmethod
    def get_name(self):
        pass

    @abstractmethod
    def get_quantity(self):
        pass


class Vegetable(Ingredient):
    def get_name(self):
        return self.name

    def get_quantity(self):
        return f"{self.quantity} кг"


class Fruit(Ingredient):

    def get_name(self):
        return self.name

    def get_quantity(self):
        return f"{self.quantity} кг"


# Пример использования:
carrot = Vegetable("Морковь", 5)
apple = Fruit("Яблоки", 10)

print(carrot.get_name())
print(carrot.get_quantity())

print(apple.get_name())
print(apple.get_quantity())
