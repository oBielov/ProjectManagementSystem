DROP DATABASE IF EXISTS PMS_DB;
CREATE DATABASE IF NOT EXISTS PMS_DB DEFAULT CHARACTER SET utf8;
USE PMS_DB;

CREATE TABLE IF NOT EXISTS companies (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(25) NOT NULL,
  city VARCHAR(25)
)
  ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS customers (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(25) NOT NULL,
  city VARCHAR(25) NOT NULL,
  area VARCHAR(25)
)
  ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS projects (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(25) NOT NULL,
  industry VARCHAR(25),
  company_id INT NOT NULL,
  customer_id INT NOT NULL,
  FOREIGN KEY (company_id) REFERENCES companies (id),
  FOREIGN KEY (customer_id) REFERENCES customers (id)
)
  ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS developers (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  surname VARCHAR(30) NOT NULL,
  age INT(2) NOT NULL,
  gender ENUM('F', 'M'),
  company_id INT NOT NULL,
  FOREIGN KEY (company_id) REFERENCES companies (id)
)
  ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS skills (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name ENUM ('C++', 'Python', 'Java', 'Ruby', 'JS', '.NET', 'C#'),
  skill ENUM ('Trainee', 'Junior', 'Middle', 'Senior')
)
  ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS developers_skills(
  developer_id INT NOT NULL,
  skill_id INT NOT NULL,
  PRIMARY KEY (developer_id, skill_id),
  FOREIGN KEY (developer_id) REFERENCES developers (id),
  FOREIGN KEY (skill_id) REFERENCES skills (id)
)
  ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS developers_projects(
  developer_id INT NOT NULL,
  project_id INT NOT NULL,
  PRIMARY KEY (developer_id, project_id),
  FOREIGN KEY (developer_id) REFERENCES developers (id),
  FOREIGN KEY (project_id) REFERENCES projects (id)
)
  ENGINE = InnoDB;
