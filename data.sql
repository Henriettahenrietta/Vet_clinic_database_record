INSERT INTO animals (
    id, 
    name, 
    date_of_birth, 
    escape_attempts, 
    neutered, 
    weight_kg
) VALUES 
    (1, 'Agumon', '2020-02-03', 0, true, 10.23),
    (2, 'Gabumon', '2018-11-15', 2, true, 8.00),
    (3, 'Pikachu', '2021-01-07', 1, false, 15.04),
    (4, 'Devimon', '2017-05-12', 5, false, 11.00);

-- Insert new data to animals table
INSERT INTO animals (animal_name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Charmander', '2020-02-08', 0, false, 11),
('Plantmon', '2021-11-15', 2, true, -5.7),
('Squirtle', '1993-04-02', 3, false, -12.13),
('Angemon', '2005-06-12', 1, true, -45),
('Boarmon', '2005-06-07', 7, true, 20.4),
('Blossom', '1998-10-13', 3, true, 17),
('Ditto', '2022-05-14', 4, true, 22);


/*INSERT OWNERS*/
INSERT INTO owners (full_name, age) VALUES
('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

/*INSERT SPECIES*/
INSERT INTO species
(species_name) VALUES
('Pokemon'),
('Digimon');

/*ASSIGN SPECIES TO ANIMALS */

/* Digimon = names ending with "mon" */
UPDATE animals
SET species_id = (
    SELECT id FROM species WHERE name = 'Digimon'
)
WHERE name LIKE '%mon';

/* Pokemon = all others */
UPDATE animals
SET species_id = (
    SELECT id FROM species WHERE name = 'Pokemon'
)
WHERE species_id IS NULL;

/*ASSIGN OWNERS TO ANIMALS*/

/* Sam Smith owns Agumon */
UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith')
WHERE name = 'Agumon';

/* Jennifer Orwell owns Gabumon and Pikachu */
UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
WHERE name IN ('Gabumon', 'Pikachu');

/* Bob owns Devimon and Plantmon */
UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob')
WHERE name IN ('Devimon', 'Plantmon');

/* Melody Pond owns Charmander, Squirtle, Blossom */
UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond')
WHERE name IN ('Charmander', 'Squirtle', 'Blossom');

/* Dean Winchester owns Angemon and Boarmon */
UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
WHERE name IN ('Angemon', 'Boarmon');
