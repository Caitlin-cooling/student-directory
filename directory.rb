#let's put all of the students in an array
students = [
 {name: "Dr. Hannibal Lecter", cohort: :november},
 {name: "Darth Vader", cohort: :november},
 {name: "Nurse Ratched", cohort: :november},
 {name: "Michael Corleone", cohort: :november},
 {name: "Alex DeLange", cohort: :november},
 {name: "The Wicked Witch of the West", cohort: :november},
 {name: "Terminator", cohort: :november},
 {name: "Freddy Krueger", cohort: :november},
 {name: "The Joker", cohort: :november},
 {name: "Joffery Baratheon", cohort: :november},
 {name: "Norman Bates", cohort: :november}
]
def print_header
  puts "The student of Villians Academy"
  puts "-------------"
end
def print(students)
  students.each { |student| puts "#{student[:name]} (#{student[:cohort]} cohort)"}
end
def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end
#we then need to call the methods

print_header
print(students)
print_footer(students)
