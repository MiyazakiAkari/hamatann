# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Lecture.create!(
  semester: 1,
  day: "Monday",
  time: 1,
  course: "Course Name 1",
  title: "Lecture Title 1",
  faculty: "Faculty Name 1",
  teacher: "Teacher Name 1",
  edited: false,
  where: "Classroom 101",
  user_id: 1
)

Lecture.create!(
  semester: 1,
  day: "Tuesday",
  time: 2,
  course: "Course Name 2",
  title: "Lecture Title 2",
  faculty: "Faculty Name 2",
  teacher: "Teacher Name 2",
  edited: false,
  where: "Classroom 102",
  user_id: 1
)

Lecture.create!(
  semester: 1,
  day: "Tuesday",
  time: 2,
  course: "Course Name 3",
  title: "Lecture Title 3",
  faculty: "Faculty Name 3",
  teacher: "Teacher Name 3",
  edited: false,
  where: "Classroom 103",
  user_id: 1
)

Lecture.create!(
  semester: 1,
  day: "Tuesday",
  time: 2,
  course: "Course Name 4",
  title: "Lecture Title 4",
  faculty: "Faculty Name 4",
  teacher: "Teacher Name 4",
  edited: false,
  where: "Classroom 104",
  user_id: 1
)