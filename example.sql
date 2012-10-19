
# find pete's courses
SELECT students.name, courses.name
FROM students
JOIN student_courses
  ON students.id = student_courses.student_id
JOIN courses
  ON student_courses.course_id = courses.id
WHERE students.id = 1

# find students in courses
SELECT courses.name, students.name
FROM courses
JOIN student_courses
  ON student_courses.course_id = courses.id
JOIN students
  ON student_courses.student_id = students.id
ORDER BY courses.name, students.name

# count student counts per course  but it ONly shows courses for courses that have students
SELECT courses.name, count(students.name)
FROM courses
JOIN student_courses
  ON student_courses.course_id = courses.id
JOIN students
  ON student_courses.student_id = students.id
GROUP BY courses.name

# count student counts per course including ONes that have no signups
SELECT courses.name, count(students.name)
FROM courses
LEFT JOIN student_courses
             ON student_courses.course_id = courses.id
LEFT JOIN students
             ON student_courses.student_id = students.id
GROUP BY courses.name

# closer look at what is happening.   notice the null ON the right
SELECT courses.name, students.name
FROM courses
LEFT JOIN student_courses
             ON student_courses.course_id = courses.id
LEFT JOIN students
             ON student_courses.student_id = students.id

# with right outer JOIN the null is ON the left
SELECT courses.name, students.name
FROM courses
RIGHT JOIN student_courses
              ON student_courses.course_id = courses.id
RIGHT JOIN students
              ON student_courses.student_id = students.id

# FULL OUTER JOIN gives nulls in both side
SELECT courses.name, students.name
FROM courses
FULL JOIN student_courses
              ON student_courses.course_id = courses.id
FULL JOIN students
              ON student_courses.student_id = students.id
