def ask_for_name
  puts "Please enter the name of a student"
  puts "To finish, enter stop"
  name = gets.tr("\n", "").downcase
end
def input_students
  students = []
  while true do
    name = ask_for_name
    if name == "stop"
      break
    elsif name == ""
      puts "Please enter your name"
      name = gets.tr("\n", "")
    end
    puts "What cohort are they taking part in?"
    cohort = gets.tr("\n", "")
    if cohort == ""
      cohort = "november"
    end
    students << {name: name, cohort: cohort.to_sym}
    puts "Now we have #{students.count} students"
  end
  students
end
def print_header
  puts "The student of Villians Academy".center(45)
  puts "-------------".center(45)
end
def print(students)
  sorted_students = students.group_by{ |student| student[:cohort] }
  sorted_students.each do |cohort_month, students|
    students.each do |student|
      puts "#{student[:name]} is in the #{student[:cohort]} cohort"
    end
  end
end
def print_footer(students)
  if students.count == 1
    puts "Overall, we have #{students.count} great student"
  else
    puts "Overall, we have #{students.count} great students"
  end
end

students = input_students
print_header
print(students)
print_footer(students)
