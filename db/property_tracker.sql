DROP TABLE IF EXISTS property_tracker;
CREATE TABLE property_tracker(
  address VARCHAR(255),
  value INT,
  num_of_bedrooms INT,
  yr_build INT,
  id SERIAL PRIMARY KEY
);
