CREATE TABLE animals (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL(10, 2) 
);

-- Add a column species of type string to your animals table. 
ALTER TABLE animals ADD COLUMN species VARCHAR(100);
