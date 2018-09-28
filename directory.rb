require "csv"
@students = []
def print_menu
  puts "1. Input the students", "2. Show the students", "3. Save the list of students",
        "4. Load the list of students", "9. Exit"
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
      puts "File saved."
  when "4"
    load_students
    try_load_students
    puts "File loaded."
  when"9"
    puts "Exiting now."
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
  puts "Please enter the name of a student", "To finish, enter stop"
  @name = STDIN.gets.tr("\n", "").downcase
end
def input_students
  while true do
    ask_for_name
    if @name == "stop"
      break
    elsif @name == ""
      puts "Please enter your name"
      @name = STDIN.gets.tr("\n", "")
    end
    input_cohort
    add_students
    puts "Now we have #{@students.count} students"
  end
end
def input_cohort
  puts "What cohort are they taking part in?"
  @cohort = STDIN.gets.tr("\n", "")
  @cohort = "november" if @cohort == ""
end
def add_students
  @students << {name: @name, cohort: @cohort.to_sym}
end
def print_header
  puts "The student of Villians Academy".center(45)
  puts "-------------".center(45)
end
def print_students_list
  sorted_students = @students.group_by{ |student| student[:cohort] }
  sorted_students.each do |cohort_month, students|
    students.each do |student|
      puts "#{student[:name]} is in the #{student[:cohort]} cohort".center(45)
    end
  end
end
def print_footer
  if @students.count == 1
    puts "Overall, we have #{@students.count} great student".center(45)
  else
    puts "Overall, we have #{@students.count} great students".center(45)
  end
end
def ask_for_file
  puts "What is the name of the file"
  gets.chomp
end
def save_students
  CSV.open(ask_for_file, "a") do |file| #can you use a? or does it have to be wb?
    @students.each do |student|
      csv_line = [student[:name], student[:cohort]]
      file << csv_line
    end
  end
end
def load_students(filename = ask_for_file)
  CSV.foreach(filename) do |line|
    @name, @cohort = line[0], line[1]
      add_students
  end
end
def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist"
    exit
  end
end

puts File.read(__FILE__)
