<!-- # DATABASES AND POSTGRES INTRO NOTES

class Student
  def initialize(name, cohort)
    @name = name
    @cohort = cohort
  end
end

Student.new('David', 'Foxtrot')


# DATABASES
- a way of storing data in an organized way
- postgresql - relational database. Rows and columns


# Postgresql

- talks to db (database)
- it is open-source
- object-relational database management system
- takes and OOP approach to programming
- `psql` to enter console
- \l to list dbs
 -->



SELECT *
FROM country
WHERE indepyear < 1963

SELECT *
FROM country
WHERE continent = 'Africa'
AND population < 30000000
AND lifeexpectancy > 45

SELECT *
FROM country
WHERE governmentform like 'Republic'

SELECT *
FROM country
WHERE governmentform 
like '%epublic'


SELECT *
FROM country
WHERE governmentform 
like '%epublic'
AND indepyear > 1945

SELECT name, governmentform, indepyear
FROM country
WHERE indepyear > 1945
AND governmentform 
NOT LIKE '%Republic'




