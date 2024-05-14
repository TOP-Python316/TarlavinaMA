# 2.
# Палеонтологам, работающим в заповеднике для динозавров,
# понадобилось ПО для отслеживания множества травоядных и плотоядных подопечных.
# Данные, которые нужно учитывать по каждому динозавру – имя, вид, рост, вес и рацион питания.

# Создайте абстрактный класс Dinosaur с методами:
#     get_personal_name(),
#     get_breed(),
#     get_height(),
#     get_weight(),
#     get_diet().

# Затем создайте два подкласса Carnivore (плотоядный) и Herbivore (травоядный),
# которые наследуют методы Dinosaur и реализуют свои собственные версии
#     get_personal_name(),
#     get_breed(),
#     get_height(),
#     get_weight(),
#     get_diet().

# Кроме того, создайте класс DinosaurPark,
# который содержит список динозавров и имеет методы:
#     list_dinosaurs(),
#     list_carnivores()
#     list_herbivores()
# для вывода списков:
#     всех динозавров,
#     плотоядных
#     травоядных особей.


# Пример использования:
# t_rex = Carnivore('Тираннозавр', 'Рекс', 4800, 560)
# velociraptor = Carnivore('Велоцираптор', 'Зубастик', 30, 70)
# stegosaurus = Herbivore('Стегозавр', 'Стегга', 7100, 420)
# triceratops = Herbivore('Трицератопс', 'Трипси', 8000, 290)

# park = DinosaurPark()

# park.add_dinosaur(t_rex)
# park.add_dinosaur(velociraptor)
# park.add_dinosaur(stegosaurus)
# park.add_dinosaur(triceratops)


# for dinosaur in park.list_dinosaurs():
#     print(f'Имя: {dinosaur[0]}\n'
#     f'Вид: {dinosaur[1]}\n'
#     f'Вес: {dinosaur[2]} кг\n'
#     f'Рост: {dinosaur[3]} см\n'
#     f'Рацион: {dinosaur[4]}\n')


# Вывод:
# Имя: Рекс
# Вид: Тираннозавр
# Вес: 4800 кг
# Рост: 560 см
# Рацион: Плотоядный

# Имя: Зубастик
# Вид: Велоцираптор
# Вес: 30 кг
# Рост: 70 см
# Рацион: Плотоядный

# Имя: Стегга
# Вид: Стегозавр
# Вес: 7100 кг
# Рост: 420 см
# Рацион: Травоядный

# Имя: Трипси
# Вид: Трицератопс
# Вес: 8000 кг
# Рост: 290 см
# Рацион: Травоядный


from abc import ABC, abstractmethod


class Dianosaur:
    @abstractmethod
    def get_personal_name(self):
        pass

    @abstractmethod
    def get_breed(self):
        pass

    @abstractmethod
    def get_height(self):
        pass

    @abstractmethod
    def get_weight(self):
        pass

    @abstractmethod
    def get_diet(self):
        pass


class Carnivore(Dianosaur):
    def __init__(self, breed, name, height, weight):
        self.breed = breed
        self.name = name
        self.height = height
        self.weight = weight

    def get_diet(self):
        return "Плотоядный"

    def get_personal_name(self):
        return self.name

    def get_breed(self):
        return self.breed

    def get_height(self):
        return self.height

    def get_weight(self):
        return self.weight


class Herbivore(Dianosaur):
    def __init__(self, breed, name, height, weight):
        self.breed = breed
        self.name = name
        self.height = height
        self.weight = weight

    def get_diet(self):
        return "Травоядный"

    def get_personal_name(self):
        return self.name

    def get_breed(self):
        return self.breed

    def get_height(self):
        return self.height

    def get_weight(self):
        return self.weight


class DinosaurPark:
    def __init__(self):
        self.dinosaurs = []

    def list_dinosaurs(self):
        return [(dinosaurs.get_personal_name(), dinosaurs.get_breed(), dinosaurs.get_weight(), dinosaurs.get_height(), dinosaurs.get_diet()) for dinosaurs in self.dinosaurs]

    def list_carnivores(self):
        return [(dinosaurs.get_personal_name(), dinosaurs.get_breed(), dinosaurs.get_weight(), dinosaurs.get_height(), dinosaurs.get_diet()) for dinosaurs in self.dinosaurs if dinosaurs.get_diet() == 'Плотоядный']

    def list_herbivores(self):
        return [(dinosaurs.get_personal_name(), dinosaurs.get_breed(), dinosaurs.get_weight(), dinosaurs.get_height(), dinosaurs.get_diet()) for dinosaurs in self.dinosaurs if dinosaurs.get_diet() == 'Травоядный']

    def add_dinosaur(self, dinosaur):
        self.dinosaurs.append(dinosaur)


t_rex = Carnivore('Тираннозавр', 'Рекс', 4800, 560)
velociraptor = Carnivore('Велоцираптор', 'Зубастик', 30, 70)
stegosaurus = Herbivore('Стегозавр', 'Стегга', 7100, 420)
triceratops = Herbivore('Трицератопс', 'Трипси', 8000, 290)

park = DinosaurPark()
park.add_dinosaur(t_rex)
park.add_dinosaur(velociraptor)
park.add_dinosaur(stegosaurus)
park.add_dinosaur(triceratops)


print('Все динозавры: \n')
for dinosaur in park.list_dinosaurs():
    print(f'Имя: {dinosaur[0]}\n'
          f'Вид: {dinosaur[1]}\n'
          f'Вес: {dinosaur[2]} кг\n'
          f'Рост: {dinosaur[3]} см\n'
          f'Рацион: {dinosaur[4]}\n')


print('Протоядные динозавры: \n')
for dinosaur in park.list_carnivores():
    print(f'Имя: {dinosaur[0]}\n'
          f'Вид: {dinosaur[1]}\n'
          f'Вес: {dinosaur[2]} кг\n'
          f'Рост: {dinosaur[3]} см\n'
          f'Рацион: {dinosaur[4]}\n')
    

print('Травоядные динозавры: \n')
for dinosaur in park.list_herbivores():
    print(f'Имя: {dinosaur[0]}\n'
          f'Вид: {dinosaur[1]}\n'
          f'Вес: {dinosaur[2]} кг\n'
          f'Рост: {dinosaur[3]} см\n'
          f'Рацион: {dinosaur[4]}\n')
