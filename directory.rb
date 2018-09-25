@students = [] #an empty array accessible to all methods
def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end
def show_students
  print_header
  print_students_list
  print_footer
end
def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when"9"
    exit
  else
    puts "I don't know what you mean, try again"
  end
end
def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end
def ask_for_name
  puts "Please enter the name of a student"
  puts "To finish, enter stop"
  name = gets.tr("\n", "").downcase
end
def input_students
  @students = []
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
    @students << {name: name, cohort: cohort.to_sym}
    puts "Now we have #{@students.count} students"
  end
end
def print_header
  puts "The student of Villians Academy".center(45)
  puts "-------------".center(45)
end
def print_students_list
  sorted_students = @students.group_by{ |student| student[:cohort] }
  sorted_students.each do |cohort_month, students|
    students.each do |student|
      puts "#{student[:name]} is in the #{student[:cohort]} cohort"
    end
  end
end
def print_footer
  if @students.count == 1
    puts "Overall, we have #{@students.count} great student"
  else
    puts "Overall, we have #{@students.count} great students"
  end
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  puts "File saved."
end
def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

interactive_menu
