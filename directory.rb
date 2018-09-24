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
def print_header
  puts "The student of Villians Academy"
  puts "-------------"
end
def print(names)
  names.each { |student| puts student }
end
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end
#we then need to call the methods

print_header
print(students)
print_footer(students)
