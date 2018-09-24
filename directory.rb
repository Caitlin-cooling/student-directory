#let's put all of the students in an array
students = [
 "Dr. Hannibal Lecter",
 "Darth Vader",
 "Nurse Ratched",
 "Michael Corleone",
 "Alex DeLange",
 "The Wicked Witch of the West",
 "Terminator",
 "Freddy Krueger",
 "The Joker",
 "Joffery Baratheon",
 "Norman Bates"
]
puts "The student of Villians Academy"
puts "-------------"
#and then print them out
students.each { |student| puts student  }
#finally we print the total number of students
puts "Overall, we have #{students.count} great students"
