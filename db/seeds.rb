puts "Cleaning database..."
User.destroy_all
Connection.destroy_all
Meeting.destroy_all
Message.destroy_all
Question.destroy_all
Response.destroy_all
UserResponse.destroy_all

puts "Creating questions, responses..."

puts "-------------------------------------"

puts "---> Personality question"
personality_question = Question.create(description: "Personality", is_required: true)
personalities = ["Active", "Calm", "Caring", "Cheerful", "Cooperative", "Creative", "Determined", "Easygoing", "Empathetic", "Enthusiastic", "Flexible", "Friendly", "Fun", "Honest", "Joker", "Optimistic", "Organized", "Passionate", "Practical", "Proactive", "Rational", "Relaxed", "Sociable", "Tolerant"]
personalities.each do |personality|
  Response.create(answer: personality, question: personality_question)
end
puts "---> Personalities: #{personalities.size}"

puts "-------------------------------------"

puts "---> Lifestyle question"
lifestyle_question = Question.create(description: "Lifestyle", is_required: true)
lifestyles = ["Adventurer", "Art enthusiast", "Athlete", "Avid music lover", "Book lover", "Chef", "Cinema goer", "Culture enthusiast", "Dancer", "Early bird", "Entrepreneur", "Family person", "Fashionista", "Foodie", "Gamer", "Health enthusiast", "Homebird", "Night owl", "Partier", "Pet lover", "Photographer", "Shopper", "Singer", "Tech lover", "Theater fan", "Traveller", "Vegan", "Vegetarian", "Walker", "Workaholic"]
lifestyles.each do |lifestyle|
  Response.create(answer: lifestyle, question: lifestyle_question)
end
puts "---> Lifestyles: #{lifestyles.size}"

puts "-------------------------------------"

puts "---> Music question"
music_question = Question.create(description: "Music")
musics = ["Alternative", "Asian pop", "Blues", "Classical", "Country", "Dance", "Electronic", "Electronic", "Folk", "Funk", "Gospel", "Hip-Hop", "Indie", "Instrumental", "Jazz", "Latin", "Lounge", "Metal", "New age", "Opera", "Pop", "Punk", "R&B", "Reggae", "Rock", "Ska", "Soul"]
musics.each do |music|
  Response.create(answer: music, question: music_question)
end
puts "---> Musics: #{musics.size}"

puts "-------------------------------------"

puts "---> Sport question"
sport_question = Question.create(description: "Sport")
sports = ["American football", "Athletics", "Badminton", "Baseball", "Basketball", "Bodyboarding", "Bowling", "Bowls", "Boxing", "Canoeing", "Climbing", "Cricket", "Diving", "Football", "Go-karting", "Golf", "Gym", "Hiking", "Hockey", "Horse riding", "Martial arts", "Motorcycling", "Padel", "Pole dancing", "Rowing", "Rugby", "Running", "Skateboarding", "Skating", "Skiing", "Snowboarding", "Squash", "Surfing", "Swimming", "Table tennis", "Tennis", "Volleyball", "Water polo", "Windsurfing"]
sports.each do |sport|
  Response.create(answer: sport, question: sport_question)
end
puts "---> Sports: #{sports.size}"

puts "-------------------------------------"

puts "---> Movie question"
movie_question = Question.create(description: "Movie")
movies = ["Action", "Adventure", "Animation", "Comedy", "Crime", "Documentary", "Drama", "Fantasy", "Historical", "Horror", "Mystery", "Political", "Romance", "Saga", "Satire", "Sci-fi", "Thriller", "Western"]
movies.each do |movie|
  Response.create(answer: movie, question: movie_question)
end
puts "---> Movies: #{movies.size}"

puts "-------------------------------------"

puts "---> Technical question"
technical_question = Question.create(description: "Technical")
technicals = ["Computer science", "Computer engineering", "Computer software", "Computer hardware", "Programming", "Web development", "Full-stack", "Front-end", "Back-end", "Data science", "Data analysis", "Machine learning", "Artificial Intelligent (AI)", "Software development", "Software engineering", "Information Technology (IT)", "Computer networking", "Information security", "Design", "User interface (UI)", "User experience (UX)", "Freelancing", "Cryptocurrency", "Data structures and algorithms (DSA)"]
technicals.each do |technical|
  Response.create(answer: technical, question: technical_question)
end
puts "---> Technical: #{technicals.size}"

puts "-------------------------------------"

puts "---> Entrepreneur question"
entrepreneur_question = Question.create(description: "Entrepreneur")
entrepreneurs = ["Business", "Organization", "Multi-national company", "Startup", "Tech stack", "Organizing", "Finance", "Marketing", "Advertising", "Human resources", "Founder", "CEO", "Office working", "Remote working", "Teamwork"]
entrepreneurs.each do |entrepreneur|
  Response.create(answer: entrepreneur, question: entrepreneur_question)
end
puts "---> Entrepreneur: #{entrepreneurs.size}"

puts "-------------------------------------"

puts "---> Show question"
show_question = Question.create(description: "Show")
shows = ["The Big Bang Theory", "Young Sheldon", "Star Trek", "The Good Fight", "Game of Thrones", "Friends", "Survivor", "Big Brother", "The Amazing Race", "Stranger Things", "The Walking Dead", "American Horror Story", "Breaking Bad", "Riverdale", "13 Reasons Why", "The Ranch"]
shows.each do |show|
  Response.create(answer: show, question: show_question)
end
puts "---> Show: #{shows.size}"

puts "-------------------------------------"

puts "--> Option field area for freely words"
optional_field_question = Question.create(description: "Tell us whatever you have not got a chance to mention. It's best to put in keywords separated by comma.")
Response.create(answer: "Write whatever you want!!!", question: optional_field_question)

puts "-------------------------------------"

puts "Finish questions and responses!"

puts "Creating users, connections, meetings, messages..."

puts "-------------------------------------"

khoa = User.create!(first_name: "Khoa", last_name: "Le", email: "khoa@gmail.com", password: "khoa123", age: 19, occupation: "Student", gender: "Male")
danko = User.create!(first_name: "Danko", last_name: "Beribak", email: "danko@gmail.com", password: "danko123", age: 29, occupation: "Inspector", gender: "Male")
arman = User.create!(first_name: "Arman", last_name: "Balani", email: "arman@gmail.com", password: "arman123", age: 21, occupation: "Student", gender: "Male")
melissa = User.create!(first_name: "Melissa", last_name: "Lobuescher", email: "melissa@gmail.com", password: "melissa123", age: 31, gender: "Female")
ellyn = User.create!(first_name: "Ellyn", last_name: "Bouscasse", email: "ellyn@gmail.com", password: "ellyn123", age: 25, gender: "Female")

dk = Connection.create(sender: danko, receiver: khoa, status: "buddied")
km = Connection.create(sender: khoa, receiver: melissa, status: "buddied")
Connection.create(sender: danko, receiver: arman)
Connection.create(sender: danko, receiver: melissa)
Connection.create(sender: arman, receiver: melissa)
Connection.create(sender: arman, receiver: khoa)

Message.create(content: "Hi, I'm Danko. I suck at everything!", connection: dk, user: danko)
Message.create(content: "Yeah silly you", connection: dk, user: khoa)
Message.create(content: "Wanna be my coding buddy?", connection: dk, user: danko)
Message.create(content: "Lemme think about that!!!", connection: dk, user: khoa)
Message.create(content: "Hi I am Khoa :\">.", connection: km, user: khoa)
Message.create(content: "Ohhhhh Khoa, don't you know I trash talking you everyday? Hehe :>", connection: km, user: melissa)
Message.create(content: "Ahhhh, one more thing to keep in mind. I nap 3 hours everyday on Le Wagon's couch. Better don't disturb my sleep.", connection: km, user: melissa)
Message.create(content: "Who are you though?.", connection: km, user: khoa)
Message.create(content: "I am Melissaaaaaa, master of front end!", connection: km, user: melissa)

Meeting.create(connection: dk, location: "Barcelona")
Meeting.create(connection: km, location: "Badalona")

puts "---> User: #{User.count}"
puts "---> Connection: #{Connection.count}"
puts "---> Meeting: #{Meeting.count}"
puts "---> Message: #{Message.count}"

puts "-------------------------------------"

puts "Finish users, connections, meetings and messages!"

puts "Creating user responses..."

puts "-------------------------------------"

categories = [music_question, sport_question, movie_question, technical_question, entrepreneur_question, show_question]

[khoa, danko, melissa, arman].each do |user|
  rand(3..10).times do
    UserResponse.create(user: user, response: personality_question.responses.sample)
  end
  rand(3..10).times do
    UserResponse.create(user: user, response: lifestyle_question.responses.sample)
  end
  categories.each do |category|
    rand(0..10).times do
      UserResponse.create(user: user, response: category.responses.sample)
    end
  end
end

rand(3..10).times do
  UserResponse.create(user: ellyn, response: personality_question.responses.sample)
end
rand(3..10).times do
  UserResponse.create(user: ellyn, response: lifestyle_question.responses.sample)
end
categories.each do |category|
  rand(0..2).times do
    UserResponse.create(user: ellyn, response: category.responses.sample)
  end
end

puts "---> UserResponse: #{UserResponse.count}"

puts "-------------------------------------"

puts "Finish user responses!"

puts "Finished!"
