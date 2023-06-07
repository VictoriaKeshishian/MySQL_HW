## Домашнее задание семинара 2:
1. Используя операторы языка SQL,
создайте таблицу “sales”. Заполните ее данными.
Справа располагается рисунок к первому
заданию.
2. Для данных таблицы “sales” укажите тип
заказа в зависимости от кол-ва :
меньше 100 - Маленький заказ
от 100 до 300 - Средний заказ
больше 300 - Большой заказ
3. Создайте таблицу “orders”, заполните ее значениями
Выберите все заказы. В зависимости от поля order_status выведите столбец full_order_status:
OPEN – «Order is in open state» ; CLOSED - «Order is closed»; CANCELLED - «Order is cancelled»
***
## Домашнее задание семинара 3:

1.	 Напишите запрос, который вывел бы таблицу со столбцами в следующем порядке: city, sname, snum, comm. (к первой или второй таблице, используя SELECT)
2.	 Напишите команду SELECT, которая вывела бы оценку(rating), сопровождаемую именем каждого заказчика в городе San Jose. (“заказчики”)
3.	 Напишите запрос, который вывел бы значения snum всех продавцов из таблицы заказов без каких бы то ни было повторений. (уникальные значения в  “snum“ “Продавцы”)
4. 	Напишите запрос, который бы выбирал заказчиков, чьи имена начинаются с буквы G. Используется оператор "LIKE": (“заказчики”) https://dev.mysql.com/doc/refman/8.0/en/string-comparison-functions.html
5. 	Напишите запрос, который может дать вам все заказы со значениями суммы выше чем $1,000. (“Заказы”, “amt”  - сумма)
6.	Напишите запрос который выбрал бы наименьшую сумму заказа.
 (Из поля “amt” - сумма в таблице “Заказы” выбрать наименьшее значение)
7. 	Напишите запрос к таблице “Заказчики”, который может показать всех заказчиков, у которых рейтинг больше 100 и они находятся не в Риме.
***
1. Отсортируйте поле “зарплата” в порядке убывания и возрастания
2. Отсортируйте по возрастанию поле “Зарплата” и выведите 5 строк с наибольшей заработной платой (возможен подзапрос)
3. Выполните группировку всех сотрудников по специальности , суммарная зарплата которых превышает 100000

***
## Домашнее задание семинара 4:

1. Вывести на экран сколько машин каждого цвета для машин марок BMW и LADA
2. Вывести на экран марку авто(количество) и количество авто не этой
марки.
100 машин, их них 20 - BMW и 80 машин другой марки , AUDI - 30 и 70 машин другой
марки, LADA - 15, 85 авто другой марки
3. Даны 2 таблицы, созданные следующим образом:
create table test_a (id number, data varchar2(1));
create table test_b (id number);
insert into test_a(id, data) values
(10, 'A'),
(20, 'A'),
(30, 'F'),
(40, 'D'),
(50, 'C');
insert into test_b(id) values
(10),
(30),
(50); 
Напишите запрос, который вернет строки из таблицы test_a, id которых нет в таблице test_b, НЕ используя ключевого слова NOT.

***
## Домашнее задание семинара 5:
1. Создайте представление, в которое попадут автомобили стоимостью до 25 000 долларов;

2. Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW);
Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди” (аналогично)

3. Добавьте новый столбец под названием «время до следующей станции». Чтобы получить это значение, мы вычитаем время станций для пар смежных станций. Мы можем вычислить это значение без использования оконной функции SQL, но это может быть очень сложно. Проще это сделать с помощью оконной функции LEAD . Эта функция сравнивает значения из одной строки со следующей строкой, чтобы получить результат. В этом случае функция сравнивает значения в столбце «время» для станции со станцией сразу после нее.