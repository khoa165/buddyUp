puts "Cleaning database"
Question.destroy_all
Response.destroy_all

puts "Creating questions"

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
entrepreneur_question = Question.create(description: "Technical")
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

puts "Finished!"
