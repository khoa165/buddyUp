puts "Cleaning database..."
User.destroy_all
Connection.destroy_all
Meeting.destroy_all
Message.destroy_all
Question.destroy_all
Response.destroy_all
UserResponse.destroy_all

puts "---------------------------------------------------"

puts "Creating questions, responses..."

puts "---------------------------------------------------"

puts "---> Personality question"
personality_question = Question.create(description: "Personality", is_required: true)
personalities = ["Active", "Calm", "Caring", "Cheerful", "Cooperative", "Creative", "Determined", "Easygoing", "Empathetic", "Enthusiastic", "Flexible", "Friendly", "Fun", "Honest", "Joker", "Optimistic", "Organized", "Passionate", "Practical", "Proactive", "Rational", "Relaxed", "Sociable", "Tolerant"]
personalities.each do |personality|
  Response.create(answer: personality, question: personality_question)
end
puts "---> Personalities: #{personalities.size}"

puts "---------------------------------------------------"

puts "---> Lifestyle question"
lifestyle_question = Question.create(description: "Lifestyle", is_required: true)
lifestyles = ["Adventurer", "Art enthusiast", "Athlete", "Avid music lover", "Book lover", "Chef", "Cinema goer", "Culture enthusiast", "Dancer", "Early bird", "Entrepreneur", "Family person", "Fashionista", "Foodie", "Gamer", "Health enthusiast", "Homebird", "Night owl", "Partier", "Pet lover", "Photographer", "Shopper", "Singer", "Tech lover", "Theater fan", "Traveller", "Vegan", "Vegetarian", "Walker", "Workaholic"]
lifestyles.each do |lifestyle|
  Response.create(answer: lifestyle, question: lifestyle_question)
end
puts "---> Lifestyles: #{lifestyles.size}"

puts "---------------------------------------------------"

puts "---> Music question"
music_question = Question.create(description: "Music")
musics = ["Alternative", "Asian pop", "Blues", "Classical", "Country", "Dance", "Electronic", "Electronic", "Folk", "Funk", "Gospel", "Hip-Hop", "Indie", "Instrumental", "Jazz", "Latin", "Lounge", "Metal", "New age", "Opera", "Pop", "Punk", "R&B", "Reggae", "Rock", "Ska", "Soul"]
musics.each do |music|
  Response.create(answer: music, question: music_question)
end
puts "---> Musics: #{musics.size}"

puts "---------------------------------------------------"

puts "---> Sport question"
sport_question = Question.create(description: "Sports")
sports = ["American football", "Athletics", "Badminton", "Baseball", "Basketball", "Bodyboarding", "Bowling", "Bowls", "Boxing", "Canoeing", "Climbing", "Cricket", "Diving", "Football", "Go-karting", "Golf", "Gym", "Hiking", "Hockey", "Horse riding", "Martial arts", "Motorcycling", "Padel", "Pole dancing", "Rowing", "Rugby", "Running", "Skateboarding", "Skating", "Skiing", "Snowboarding", "Squash", "Surfing", "Swimming", "Table tennis", "Tennis", "Volleyball", "Water polo", "Windsurfing"]
sports.each do |sport|
  Response.create(answer: sport, question: sport_question)
end
puts "---> Sports: #{sports.size}"

puts "---------------------------------------------------"

puts "---> Movie question"
movie_question = Question.create(description: "Movies")
movies = ["Action", "Adventure", "Animation", "Comedy", "Crime", "Documentary", "Drama", "Fantasy", "Historical", "Horror", "Mystery", "Political", "Romance", "Saga", "Satire", "Sci-fi", "Thriller", "Western"]
movies.each do |movie|
  Response.create(answer: movie, question: movie_question)
end
puts "---> Movies: #{movies.size}"

puts "---------------------------------------------------"

puts "---> Technical question"
technical_question = Question.create(description: "Tech")
technicals = ["Computer science", "Computer engineering", "Computer software", "Computer hardware", "Programming", "Web development", "Full-stack", "Front-end", "Back-end", "Data science", "Data analysis", "Machine learning", "Artificial Intelligent (AI)", "Software development", "Software engineering", "Information Technology (IT)", "Computer networking", "Information security", "Design", "User interface (UI)", "User experience (UX)", "Freelancing", "Cryptocurrency", "Data structures and algorithms (DSA)"]
technicals.each do |technical|
  Response.create(answer: technical, question: technical_question)
end
puts "---> Technical: #{technicals.size}"

puts "---------------------------------------------------"

puts "---> Entrepreneur question"
entrepreneur_question = Question.create(description: "Entrepreneurial")
entrepreneurs = ["Business", "Organization", "Multi-national company", "Startup", "Tech stack", "Organizing", "Finance", "Marketing", "Advertising", "Human resources", "Founder", "CEO", "Office working", "Remote working", "Teamwork"]
entrepreneurs.each do |entrepreneur|
  Response.create(answer: entrepreneur, question: entrepreneur_question)
end
puts "---> Entrepreneur: #{entrepreneurs.size}"

puts "---------------------------------------------------"

puts "---> Show question"
show_question = Question.create(description: "Tv shows")
shows = ["The Big Bang Theory", "Young Sheldon", "Star Trek", "The Good Fight", "Game of Thrones", "Friends", "Survivor", "Big Brother", "The Amazing Race", "Stranger Things", "The Walking Dead", "American Horror Story", "Breaking Bad", "Riverdale", "13 Reasons Why", "The Ranch"]
shows.each do |show|
  Response.create(answer: show, question: show_question)
end
puts "---> Show: #{shows.size}"

puts "---------------------------------------------------"

puts "---> Option field area for freely words"
optional_field_question = Question.create(description: "Tell us whatever you have not got a chance to mention. It's best to put in keywords separated by comma.")
Response.create(answer: "Write whatever you want!!!", question: optional_field_question)

puts "---------------------------------------------------"

puts "Finish questions and responses!"

puts "---------------------------------------------------"

puts "Creating users..."

puts "---------------------------------------------------"

puts "Creating team members..."

puts "---------------------------------------------------"

khoa = User.create!(intro: "member of an amazing team", first_name: "Khoa", last_name: "Le", email: "khoa@gmail.com", password: "khoa123", age: 19, occupation: "Student", gender: "Male", address: "Barcelona")
danko = User.create!(intro: "member of an amazing team", first_name: "Danko", last_name: "Beribak", email: "danko@gmail.com", password: "danko123", age: 29, occupation: "Inspector", gender: "Male", address: "Barcelona")
arman = User.create!(intro: "member of an amazing team", first_name: "Arman", last_name: "Balani", email: "arman@gmail.com", password: "arman123", age: 21, occupation: "Student", gender: "Male", address: "Barcelona")
melissa = User.create!(intro: "member of an amazing team", first_name: "Melissa", last_name: "Lobuescher", email: "melissa@gmail.com", password: "melissa123", age: 31, gender: "Female", address: "Barcelona")

puts "Creating teachers and TAs..."

puts "---------------------------------------------------"

ellyn = User.create!(intro: "amazing coding bootcamp teacher", first_name: "Ellyn", last_name: "Bouscasse", email: "ellyn@gmail.com", password: "ellyn123", age: 25, gender: "Female", address: "Barcelona")
avalon = User.create!(intro: "amazing coding bootcamp teacher", first_name: "Avalon", last_name: "Van Der Horst", email: "avalon@gmail.com", password: "avalon123", age: 25, gender: "Female", address: "Barcelona")
gus = User.create!(intro: "amazing coding bootcamp teacher", first_name: "Gus", last_name: "De Vita", email: "gus@gmail.com", password: "gus123", age: 25, gender: "Male", address: "Barcelona")
daniel = User.create!(intro: "amazing coding bootcamp teacher", first_name: "Daniel", last_name: "Gordon", email: "daniel@gmail.com", password: "daniel123", age: 25, gender: "Male", address: "Barcelona")
inou = User.create!(intro: "amazing coding bootcamp teacher", first_name: "Inou", last_name: "Ridder", email: "inou@gmail.com", password: "inou123", age: 25, gender: "Male", address: "Barcelona")
valerie = User.create!(intro: "amazing coding bootcamp teacher", first_name: "Valerie", last_name: "Schraauwers", email: "valerie@gmail.com", password: "valerie123", age: 25, gender: "Female", address: "Barcelona")
mirha = User.create!(intro: "amazing coding bootcamp teacher", first_name: "Mirha", last_name: "Masala", email: "mirha@gmail.com", password: "mirha123", age: 25, gender: "Female", address: "Barcelona")

puts "Creating classmates..."

puts "---------------------------------------------------"

abs = User.create!(intro: "amazing coding bootcamp student", first_name: "Abs", last_name: "Yade", email: "abs@gmail.com", password: "abs123", age: 25, gender: "Male", address: "Barcelona")
amine = User.create!(intro: "amazing coding bootcamp student", first_name: "Amine", last_name: "Boukhriss", email: "amine@gmail.com", password: "amine123", age: 25, gender: "Male", address: "Barcelona")
barbara = User.create!(intro: "member of the cool car", first_name: "Barbara", last_name: "Peric", email: "barbara@gmail.com", password: "barbara123", age: 25, gender: "Female", address: "Barcelona")
cihad = User.create!(intro: "member of the cool car", first_name: "Cihad", last_name: "Saglam", email: "cihad@gmail.com", password: "cihad123", age: 25, gender: "Male", address: "Barcelona")
fahad = User.create!(intro: "amazing coding bootcamp student", first_name: "Fahad", last_name: "Al Rasheed", email: "fahad@gmail.com", password: "fahad123", age: 25, gender: "Male", address: "Barcelona")
ferdinand = User.create!(intro: "amazing coding bootcamp student", first_name: "Ferdinand", last_name: "Croy", email: "ferdinand@gmail.com", password: "ferdinand123", age: 25, gender: "Male", address: "Barcelona")
francois = User.create!(intro: "amazing coding bootcamp student", first_name: "Francois", last_name: "Adrien", email: "francois@gmail.com", password: "francois123", age: 25, gender: "Male", address: "Barcelona")
glen = User.create!(intro: "amazing coding bootcamp student", first_name: "Glen", last_name: "Warren", email: "glen@gmail.com", password: "glen123", age: 25, gender: "Male", address: "Barcelona")
jaime = User.create!(intro: "amazing coding bootcamp student", first_name: "Jaime", last_name: "Cruz", email: "jaime@gmail.com", password: "jaime123", age: 25, gender: "Male", address: "Barcelona")
josephine = User.create!(intro: "amazing coding bootcamp student", first_name: "Josephine", last_name: "Geoghegan", email: "josephine@gmail.com", password: "josephine123", age: 25, gender: "Female", address: "Barcelona")
kaveh = User.create!(intro: "amazing coding bootcamp student", first_name: "Kaveh", last_name: "Jalilian", email: "kaveh@gmail.com", password: "kaveh123", age: 25, gender: "Male", address: "Barcelona")
maria = User.create!(intro: "amazing coding bootcamp student", first_name: "Maria", last_name: "Manninen", email: "maria@gmail.com", password: "maria123", age: 25, gender: "Female", address: "Barcelona")
matthis = User.create!(intro: "amazing coding bootcamp student", first_name: "Matthis", last_name: "Parisot", email: "matthis@gmail.com", password: "matthis123", age: 25, gender: "Male", address: "Barcelona")
mehdi = User.create!(intro: "amazing coding bootcamp student", first_name: "Mehdi", last_name: "Idrissi Kaitouni", email: "mehdi@gmail.com", password: "mehdi123", age: 25, gender: "Male", address: "Barcelona")
nicolas = User.create!(intro: "member of the cool car", first_name: "Nicolas", last_name: "Proto", email: "nicolas@gmail.com", password: "nicolas123", age: 25, gender: "Male", address: "Barcelona")
nikita = User.create!(intro: "amazing coding bootcamp student", first_name: "Nikita", last_name: "Bandarevich", email: "nikita@gmail.com", password: "nikita123", age: 25, gender: "Male", address: "Barcelona")
sy = User.create!(intro: "amazing coding bootcamp student", first_name: "Sy", last_name: "Rashid", email: "sy@gmail.com", password: "sy1234", age: 25, gender: "Male", address: "Barcelona")
thomas = User.create!(intro: "amazing coding bootcamp student", first_name: "Thomas", last_name: "Bonnet", email: "thomas@gmail.com", password: "thomas123", age: 25, gender: "Male", address: "Barcelona")
uri = User.create!(intro: "amazing coding bootcamp student", first_name: "Uri", last_name: "Serra", email: "uri@gmail.com", password: "uri123", age: 25, gender: "Male", address: "Barcelona")
victor = User.create!(intro: "amazing coding bootcamp student", first_name: "Victor", last_name: "Padilla", email: "victor@gmail.com", password: "victor123", age: 25, gender: "Male", address: "Barcelona")
wendela = User.create!(intro: "member of the cool car", first_name: "Wendela", last_name: "Lovgren", email: "wendela@gmail.com", password: "wendela123", age: 25, gender: "Female", address: "Barcelona")
xinyi = User.create!(intro: "amazing coding bootcamp student", first_name: "Xinyi", last_name: "Wu", email: "xinyi@gmail.com", password: "xinyi123", age: 25, gender: "Female", address: "Barcelona")
zach = User.create!(intro: "amazing coding bootcamp student", first_name: "Zach", last_name: "Alvstad", email: "zach@gmail.com", password: "zach123", age: 25, gender: "Male", address: "Barcelona")

puts "Creating random profiles..."

popular_fn = ["James", "John", "Robert", "Michael", "William", "David", "Richard", "Joseph", "Thomas", "Charles", "Christopher", "Daniel", "Matthew", "Anthony", "Donald", "Mark", "Paul", "Steven", "Andrew", "Kenneth", "Joshua", "George", "Kevin", "Brian", "Edward", "Ronald", "Timothy", "Jason", "Jeffrey", "Ryan", "Jacob", "Gary", "Nicholas", "Eric", "Stephen", "Jonathan", "Larry", "Justin", "Scott", "Brandon", "Frank", "Benjamin", "Gregory", "Samuel", "Raymond", "Patrick", "Alexander", "Jack", "Dennis", "Jerry"]
popular_ln = ["Smith", "Johson", "Williams", "Jones", "Brown", "Davis", "Miller", "Wilson", "Moore", "Taylor", "Anderson", "Thomas", "Jackson", "White", "Harris", "Martin", "Thompson", "Garcia", "Martinez", "Robinson", "Clark", "Rodriguez", "Lewis", "Lee", "Walker", "Hall", "Allen", "Young", "Hernandez", "King", "Wright", "Lopez", "Hill", "Scott", "Green", "Adams", "Baker", "Gonzalez", "Nelson", "Carter", "Mitchell", "Perez", "Roberts", "Turner", "Phillips", "Campbell", "Parker", "Evans", "Edwards", "Collins"]

# popular_names = []
# 200.times do
#   popular_names << [popular_fn.sample, popular_ln.sample]
# end
# popular_names = popular_names.uniq

# popular_names.each do |name|
#   fn = name[0]
#   ln = name[1]
#   gender = rand(1..2) == 1 ? "Male" : "Female"
#   User.create!(first_name: fn, last_name: ln, email: "#{fn}#{ln}@gmail.com", password: "#{fn}#{ln}123", age: 30, gender: gender)
# end

puts "---------------------------------------------------"

puts "Finish users!"

puts "---------------------------------------------------"

puts "Creating connections, meetings, messages..."

puts "---------------------------------------------------"

dk = Connection.create(sender: danko, receiver: khoa, status: "buddied")
km = Connection.create(sender: khoa, receiver: melissa, status: "buddied")
# Connection.create(sender: danko, receiver: arman)
# Connection.create(sender: danko, receiver: melissa)
# Connection.create(sender: arman, receiver: melissa)
# Connection.create(sender: arman, receiver: khoa)

Message.create(content: "Hi, I'm Danko - master of JavaScript and jQuery!", connection: dk, user: danko)
Message.create(content: "Weren't you the guy mistaken string interpolation of JS as jQuery symbol :P", connection: dk, user: khoa)
Message.create(content: "Hmmm you a******", connection: dk, user: danko)
Message.create(content: "You suck :\">", connection: dk, user: khoa)
Message.create(content: "Hi I am Khoa :\">", connection: km, user: khoa)
Message.create(content: "Ohhhhh Khoa, don't you know I trash talking you everyday? Hehe :>", connection: km, user: melissa)
Message.create(content: "Btw, just so you know, I'm gonna overthrow your leadership and take over the BuddyUppppppp", connection: km, user: melissa)
Message.create(content: "Awwwww, scary!?. Said who?", connection: km, user: khoa)
Message.create(content: "Said Medussaaaaaa, master of front end!!!!", connection: km, user: melissa)
Message.create(content: "Oops, I meant Melissa...", connection: km, user: melissa)

Meeting.create(connection: dk, location: "Barcelona", date: Date.new(2019, 9, rand(1..30)))
Meeting.create(connection: km, location: "Berlin", date: Date.new(2019, 9, rand(1..30)))

puts "Finish connections, meetings and messages!"

puts "---------------------------------------------------"

puts "Creating user responses..."

puts "---------------------------------------------------"

categories = [music_question, sport_question, movie_question, technical_question, entrepreneur_question, show_question]

User.all.each do |user|
  personality_question.responses.sample(rand(3..5)).each do |ur|
    UserResponse.create(user: user, response: ur)
  end
  lifestyle_question.responses.sample(rand(3..5)).each do |ur|
    UserResponse.create(user: user, response: ur)
  end
  categories.each do |category|
    category.responses.sample(rand(0..5)).each do |ur|
      UserResponse.create(user: user, response: ur)
    end
  end
end

puts "Finish user responses!"

puts "---------------------------------------------------"

puts "---> User: #{User.count}"
puts "---> Connection: #{Connection.count}"
puts "---> Meeting: #{Meeting.count}"
puts "---> Message: #{Message.count}"
puts "---> Question: #{Question.count}"
puts "---> Response: #{Response.count}"
puts "---> UserResponse: #{UserResponse.count}"

puts "---------------------------------------------------"

puts "Finished!"

puts "---------------------------------------------------"
