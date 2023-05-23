CREATE DATABASE global_energy;

-- creating first table, Primary energy consumption is in per capita (kWh/person)

CREATE TABLE per_capita(
    entity text,
    code text,
    year INT,
    consumption FLOAT
);

-- copying from csv to the per_capita table
-- data from Kaggle Our World in Data https://www.kaggle.com/datasets/pralabhpoudel/world-energy-consumption

COPY per_capita (entity, code, year, consumption)
FROM '/Users/kevin/Google Drive/My Drive/dataAnalysis/SQLdatabase_analysis/data/global_energy_usage.csv'
WITH (FORMAT csv, HEADER);


-- need to clean up columns for code that have 'OWID' 'our world in data' before them
-- can use UPDATE table to remove OWID_

UPDATE per_capita
SET code = REPLACE(code, 'OWID_', '')
WHERE code LIKE 'OWID_%';

-- change 'entity' to 'country'
ALTER TABLE per_capita
RENAME COLUMN entity TO country;

-- change datatype of 'code' to 3 letter CHAR
ALTER TABLE per_capita
ALTER column code TYPE CHAR(3);


-- creating a table for world population data, data from https://www.kaggle.com/datasets/iamsouravbanerjee/world-population-dataset
CREATE TABLE global_population(
    rank integer,
    code char(3),
    country text,
    capital text,
    continent text,
    _2022 float,
    _2020 float,
    _2015 float,
    _2010 float,
    _2000 float,
    _1990 float,
    _1980 float,
    _1970 float,
    Area_km_sq float,
    Density_per_km_sq float,
    growth_rate float,
    world_pop_percentage float
);


-- putting in world population data, copying from csv to the global_population table
-- data from Kaggle Our World in Data https://www.kaggle.com/datasets/iamsouravbanerjee/world-population-dataset

COPY global_population (rank, code, country, capital, continent, _2022, _2020, _2015, _2010, _2000, _1990, _1980, _1970, Area_km_sq, Density_per_km_sq, growth_rate, world_pop_percentage)
FROM '/Users/kevin/Google Drive/My Drive/dataAnalysis/SQLdatabase_analysis/data/world_population.csv'
WITH (FORMAT csv, HEADER);




