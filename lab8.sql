-- Создаем таблицу СТРАНЫ
CREATE TABLE Страны (
    id_country SERIAL PRIMARY KEY,
    country_name VARCHAR(100) NOT NULL UNIQUE
);

-- Создаем таблицу КЛИЕНТЫ
CREATE TABLE Клиенты (
    id SERIAL PRIMARY KEY,
    fio VARCHAR(100) NOT NULL,
    passport_data VARCHAR(50) NOT NULL
);

-- Создаем таблицу МАРШРУТЫ
CREATE TABLE Маршруты (
    id SERIAL PRIMARY KEY,
    country_id INT REFERENCES Страны(id_country) ON DELETE CASCADE,
    trip_purpose VARCHAR(100) NOT NULL,
    daily_cost NUMERIC(10, 2) NOT NULL,
    transport_cost NUMERIC(10, 2) NOT NULL,
    visa_cost NUMERIC(10, 2) NOT NULL
);

-- Создаем таблицу ПОЕЗДКИ
CREATE TABLE Поездки (
    id SERIAL PRIMARY KEY,
    client_id INT REFERENCES Клиенты(id) ON DELETE CASCADE,
    route_id INT REFERENCES Маршруты(id) ON DELETE CASCADE,
    start_date DATE NOT NULL,
    number_of_days INT NOT NULL
);
