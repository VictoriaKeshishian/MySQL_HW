USE homework;

CREATE TABLE Cars (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    cost INT NOT NULL,
    CONSTRAINT cost_range CHECK(cost >= 0),
    CONSTRAINT valid_name CHECK(name REGEXP '^[A-Za-z0-9 ]+$')
);

INSERT INTO Cars (name, cost)
VALUES 
    ('Audi', 52642),
    ('Mercedes', 57127),
    ('Skoda', 9000),
    ('Volvo', 29000),
    ('Bentley', 350000),
    ('Citroen', 21000),
    ('Hummer', 41400),
    ('Volkswagen', 21600);
    
SELECT * FROM Cars;
    
-- 1. Создайте представление, в которое попадут автомобили стоимостью до 25 000 долларов;
CREATE VIEW LowCostCars AS
SELECT * FROM Cars
WHERE cost <= 25000;

SELECT * FROM LowCostCars;

-- 2. Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW);
ALTER VIEW LowCostCars 
AS SELECT * FROM Cars 
WHERE cost <= 30000;

SELECT * FROM LowCostCars;

-- 3. Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди” (аналогично)
CREATE VIEW AudiSkodaCars AS
SELECT * FROM Cars
WHERE Name IN ('Audi', 'Skoda');

SELECT * FROM AudiSkodaCars;

/*
Добавьте новый столбец под названием «время до следующей станции». Чтобы получить это
значение, мы вычитаем время станций для пар смежных станций. Мы можем вычислить это
значение без использования оконной функции SQL, но это может быть очень сложно. Проще
это сделать с помощью оконной функции LEAD . Эта функция сравнивает значения из одной
строки со следующей строкой, чтобы получить результат. В этом случае функция сравнивает
значения в столбце «время» для станции со станцией сразу после нее.
*/

DROP TABLE trains;

CREATE TABLE trains (
  train_id_integer INT,
  station VARCHAR(20),
  station_time TIME
);

INSERT INTO trains (train_id_integer, station, station_time)
VALUES
  (110, 'San Francisco', '10:00:00'),
  (110, 'Redwood City', '10:54:00'),
  (110, 'Palo Alto', '11:02:00'),
  (110, 'San Jose', '12:35:00'),
  (120, 'San Francisco', '11:00:00'),
  (120, 'Palo Alto', '12:49:00'),
  (120, 'San Jose', '13:30:00');
  
SELECT * FROM trains;

-- Добавляем новый столбец "время до следующей станции" к таблице "trains".
ALTER TABLE trains ADD COLUMN time_to_next_station TIME;

-- Обновляем значения в новом столбце "time_to_next_station" с использованием функции LEAD
SELECT 
  train_id_integer,
  station,
  station_time,
  IFNULL(
    TIMEDIFF(
      LEAD(station_time) OVER (PARTITION BY train_id_integer ORDER BY station_time),
      station_time
    ),
    NULL
  ) AS time_to_next_station
FROM trains;



