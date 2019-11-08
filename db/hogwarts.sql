DROP TABLE students;
DROP TABLE houses;



CREATE TABLE houses (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  logo VARCHAR(512)
);


CREATE TABLE students(
  id SERIAL8 PRIMARY KEY,
  first_name VARCHAR(255),
  second_name VARCHAR(255),
  house_id INT4 REFERENCES houses(id),
  age INT4
);
