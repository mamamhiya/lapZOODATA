CREATE DATABASE ZOODB;

USE ZOODB;

CREATE TABLE AnimalType(
    animal_type_id INT PRIMARY KEY NOT Null,
    animal_type_name NVARCHAR(100) NOT Null,
    description NVARCHAR(MAX) NULL,
)

CREATE TABLE Speciesinfo(
    species_info_id INT PRIMARY KEY NOT Null,
    common_name NVARCHAR(100) Null,
    scientific_name NVARCHAR(100) Null,
    habitat NVARCHAR(MAX) Null,
    deit NVARCHAR(MAX) NULL,
    conservation_status NVARCHAR(100) NULL
)

CREATE TABLE Enclosure (
    enclosure_id INT PRIMARY KEY NOT Null,
    name NVARCHAR(100) NOT Null,
    location NVARCHAR(200) NULL
)

CREATE TABLE Keeper(
    keeper_id INT PRIMARY KEY NOT Null,
    name NVARCHAR(100) NOT Null,
    phone NVARCHAR(50) NULL,
    email NVARCHAR(100) NULL
)

CREATE TABLE EnclosureKeeper(
    enclosure_id INT NOT Null,
    keeper_id INT NOT Null,
    PRIMARY KEY (enclosure_id, keeper_id),
    FOREIGN KEY (enclosure_id) REFERENCES Enclosure(enclosure_id),
    FOREIGN KEY (keeper_id) REFERENCES Keeper(keeper_id)
)

CREATE TABLE Food(
    food_id INT PRIMARY KEY NOT Null,
    name NVARCHAR(100) NOT Null,
    type NVARCHAR(100) Null,
    unit NVARCHAR(50) Null,
)

CREATE TABLE Animal(
    animal_id INT PRIMARY KEY NOT Null,
    name NVARCHAR(100) NOT Null,
    gender NVARCHAR(10) Null,
    birth_date DATE Null,
    enclosure_id INT Null,
    animal_type_id INT Null,
    species_info_id INT Null,
    FOREIGN KEY (enclosure_id) REFERENCES Enclosure(enclosure_id),
    FOREIGN KEY (animal_type_id) REFERENCES AnimalType(animal_type_id),
    FOREIGN KEY (species_info_id) REFERENCES Speciesinfo(species_info_id)
)

CREATE TABLE FeedingSchedule(
    feeding_id INT PRIMARY KEY NOT Null,
    animal_id INT Null,
    food_id INT Null,
    amount DECIMAL(10,2) Null,
    feeding_date DATE Null,
    feeding_time TIME Null,
    keeper_id INT Null,
    FOREIGN KEY (animal_id) REFERENCES Animal(animal_id),
    FOREIGN KEY (food_id) REFERENCES Food(food_id),
    FOREIGN KEY (keeper_id) REFERENCES Keeper(keeper_id),
)