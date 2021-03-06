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
musics = ["Alternative", "Asian pop", "Blues", "Classical", "Country", "Dance", "Electronic", "Folk", "Funk", "Gospel", "Hip-Hop", "Indie", "Instrumental", "Jazz", "Latin", "Lounge", "Metal", "New age", "Opera", "Pop", "Punk", "R&B", "Reggae", "Rock", "Ska", "Soul"]
musics.each do |music|
  Response.create(answer: music, question: music_question)
end
puts "---> Musics: #{musics.size}"

puts "---------------------------------------------------"

puts "---> Sport question"
sport_question = Question.create(description: "Sports")
sports = ["American football", "Athletics", "Badminton", "Baseball", "Basketball", "Bodyboarding", "Bowling", "Bowls", "Boxing", "Canoeing", "Climbing", "Cricket", "Diving", "Football", "Go-karting", "Golf", "Gym", "Hiking", "Hockey", "Horse riding", "Martial arts", "Motorcycling", "Crossfit", "Pole dancing", "Rowing", "Rugby", "Running", "Skateboarding", "Skating", "Skiing", "Snowboarding", "Squash", "Surfing", "Swimming", "Table tennis", "Tennis", "Volleyball", "Water polo", "Windsurfing"]
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

khoa = User.create!(current_sign_in_at: DateTime.now, intro: "member of an amazing team", first_name: "Khoa", last_name: "Le", email: "khoa@gmail.com", password: "khoa123", age: 19, occupation: "Student", gender: "Male", address: "Barcelona", country: "Spain", city: "Barcelona", remote_photo_url: "https://avatars0.githubusercontent.com/u/46258781?v=4")
danko = User.create!(current_sign_in_at: DateTime.now, intro: "member of an amazing team", first_name: "Danko", last_name: "Beribak", email: "danko@gmail.com", password: "danko123", age: 29, occupation: "Inspector", gender: "Male", address: "Barcelona", country: "Spain", city: "Barcelona", remote_photo_url: "https://avatars2.githubusercontent.com/u/47557839?v=4")
arman = User.create!(current_sign_in_at: DateTime.now, intro: "member of an amazing team", first_name: "Arman", last_name: "Balani", email: "arman@gmail.com", password: "arman123", age: 21, occupation: "Student", gender: "Male", address: "Barcelona", country: "Spain", city: "Barcelona", remote_photo_url: "https://avatars2.githubusercontent.com/u/50775861?v=4")
melissa = User.create!(current_sign_in_at: DateTime.now, intro: "member of an amazing team", first_name: "Melissa", last_name: "Lobuescher", email: "melissa@gmail.com", password: "melissa123", age: 31, gender: "Female", address: "Frankfurt", country: "Germany", city: "Frankfurt", remote_photo_url: "https://avatars3.githubusercontent.com/u/49674083?v=4")

puts "Creating teachers and TAs..."

puts "---------------------------------------------------"

ellyn = User.create!(current_sign_in_at: DateTime.new(2019, [7, 8, 8, 8, 8].sample, rand(1..28)), intro: "amazing coding bootcamp teacher", first_name: "Ellyn", last_name: "Bouscasse", email: "ellyn@gmail.com", password: "ellyn123", age: 25, gender: "Female", address: "Barcelona", country: "Spain", city: "Barcelona", remote_photo_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/ul03dampdb9to6qumjcj.jpg")
avalon = User.create!(current_sign_in_at: DateTime.new(2019, [7, 8, 8, 8, 8].sample, rand(1..28)), intro: "amazing coding bootcamp teacher", first_name: "Avalon", last_name: "Van Der Horst", email: "avalon@gmail.com", password: "avalon123", age: 25, gender: "Female", address: "Barcelona", country: "Spain", city: "Barcelona", remote_photo_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/in8eptkff0mqes4natbc.jpg")
gus = User.create!(current_sign_in_at: DateTime.new(2019, [7, 8, 8, 8, 8].sample, rand(1..28)), intro: "amazing coding bootcamp teacher", first_name: "Gus", last_name: "De Vita", email: "gus@gmail.com", password: "gus123", age: 25, gender: "Male", address: "Barcelona", country: "Spain", city: "Barcelona", remote_photo_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/y2zcqbdwqc8x6uz1xlop.jpg")
daniel = User.create!(current_sign_in_at: DateTime.new(2019, [7, 8, 8, 8, 8].sample, rand(1..28)), intro: "amazing coding bootcamp teacher", first_name: "Daniel", last_name: "Gordon", email: "daniel@gmail.com", password: "daniel123", age: 25, gender: "Male", address: "Barcelona", country: "Spain", city: "Barcelona", remote_photo_url: "https://avatars3.githubusercontent.com/u/16646026?v=4")
inou = User.create!(current_sign_in_at: DateTime.new(2019, [7, 8, 8, 8, 8].sample, rand(1..28)), intro: "amazing coding bootcamp teacher", first_name: "Inou", last_name: "Ridder", email: "inou@gmail.com", password: "inou123", age: 25, gender: "Male", address: "Barcelona", remote_photo_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/yzmhkgececsz46relki9.jpg")
valerie = User.create!(current_sign_in_at: DateTime.new(2019, [7, 8, 8, 8, 8].sample, rand(1..28)), intro: "amazing coding bootcamp teacher", first_name: "Valerie", last_name: "Schraauwers", email: "valerie@gmail.com", password: "valerie123", age: 25, gender: "Female", address: "Barcelona", country: "Spain", city: "Barcelona", remote_photo_url: "https://avatars1.githubusercontent.com/u/37805251?v=4")
mirha = User.create!(current_sign_in_at: DateTime.new(2019, [7, 8, 8, 8, 8].sample, rand(1..28)), intro: "amazing coding bootcamp teacher", first_name: "Mirha", last_name: "Masala", email: "mirha@gmail.com", password: "mirha123", age: 25, gender: "Female", address: "Barcelona", country: "Spain", city: "Barcelona", remote_photo_url: "https://avatars0.githubusercontent.com/u/26620750?v=4")
claire = User.create!(current_sign_in_at: DateTime.new(2019, [7, 8, 8, 8, 8].sample, rand(1..28)), intro: "amazing coding bootcamp teacher", first_name: "Claire", last_name: "Gautier", email: "claire@gmail.com", password: "claire123", age: 25, gender: "Female", address: "Barcelona", country: "Spain", city: "Barcelona", remote_photo_url: "https://avatars1.githubusercontent.com/u/37530869?v=4")
marin = User.create!(current_sign_in_at: DateTime.new(2019, [7, 8, 8, 8, 8].sample, rand(1..28)), intro: "amazing coding bootcamp teacher", first_name: "Marin", last_name: "Bibot", email: "marin@gmail.com", password: "marin123", age: 25, gender: "Male", address: "Barcelona", country: "Spain", city: "Barcelona", remote_photo_url: "https://avatars3.githubusercontent.com/u/45786643?v=4")
lorenzo = User.create!(current_sign_in_at: DateTime.new(2019, [7, 8, 8, 8, 8].sample, rand(1..28)), intro: "amazing coding bootcamp teacher", first_name: "Lorenzo", last_name: "Del Castillo Detoeuf", email: "lorenzo@gmail.com", password: "lorenzo123", age: 25, gender: "Male", address: "Barcelona", country: "Spain", city: "Barcelona", remote_photo_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/zmehqga4ubiwfyu9iapa.jpg")
florin = User.create!(current_sign_in_at: DateTime.new(2019, [7, 8, 8, 8, 8].sample, rand(1..28)), intro: "amazing coding bootcamp teacher", first_name: "Florin", last_name: "Diconescu", email: "florin@gmail.com", password: "florin123", age: 25, gender: "Male", address: "Barcelona", country: "Spain", city: "Barcelona", remote_photo_url: "https://avatars0.githubusercontent.com/u/49286521?v=4")
claired = User.create!(current_sign_in_at: DateTime.new(2019, [7, 8, 8, 8, 8].sample, rand(1..28)), intro: "amazing coding bootcamp teacher", first_name: "Claire", last_name: "Dinsart", email: "claired@gmail.com", password: "claired123", age: 25, gender: "Female", address: "Barcelona", country: "Spain", city: "Barcelona", remote_photo_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/eirbtjgr7qugeqmkzxde.jpg")

puts "Creating classmates..."

puts "---------------------------------------------------"

abs = User.create!(current_sign_in_at: DateTime.new(2019, [7, 8, 8, 8, 8].sample, rand(1..28)), intro: "amazing coding bootcamp student", first_name: "Abs", last_name: "Yade", email: "abs@gmail.com", password: "abs123", age: 25, gender: "Male", address: "Barcelona", country: "Spain", city: "Barcelona", remote_photo_url: "https://avatars0.githubusercontent.com/u/49921457?v=4")
amine = User.create!(current_sign_in_at: DateTime.new(2019, [7, 8, 8, 8, 8].sample, rand(1..28)), intro: "amazing coding bootcamp student", first_name: "Amine", last_name: "Boukhriss", email: "amine@gmail.com", password: "amine123", age: 25, gender: "Male", address: "Frankfurt", country: "Germany", city: "Frankfurt", remote_photo_url: "https://avatars3.githubusercontent.com/u/28905895?v=4")
barbara = User.create!(current_sign_in_at: DateTime.new(2019, [7, 8, 8, 8, 8].sample, 28, 15, 6, 7), intro: "member of the cool car", first_name: "Barbara", last_name: "Peric", email: "barbara@gmail.com", password: "barbara123", age: 25, gender: "Female", address: "Barcelona", country: "Spain", city: "Barcelona", remote_photo_url: "https://avatars3.githubusercontent.com/u/50910606?v=4")
cihad = User.create!(current_sign_in_at: DateTime.new(2019, [7, 8, 8, 8, 8].sample, rand(1..28)), intro: "member of the cool car", first_name: "Cihad", last_name: "Saglam", email: "cihad@gmail.com", password: "cihad123", age: 25, gender: "Male", address: "Madrid", country: "Spain", city: "Madrid", remote_photo_url: "https://avatars0.githubusercontent.com/u/29354309?v=4")
fahad = User.create!(current_sign_in_at: DateTime.new(2019, [7, 8, 8, 8, 8].sample, rand(1..28)), intro: "amazing coding bootcamp student", first_name: "Fahad", last_name: "Al Rasheed", email: "fahad@gmail.com", password: "fahad123", age: 25, gender: "Male", address: "Madrid", country: "Spain", city: "Madrid", remote_photo_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/yli3bpplfnizttpmou1w.jpg")
ferdinand = User.create!(current_sign_in_at: DateTime.new(2019, [7, 8, 8, 8, 8].sample, rand(1..28)), intro: "amazing coding bootcamp student", first_name: "Ferdinand", last_name: "Croy", email: "ferdinand@gmail.com", password: "ferdinand123", age: 25, gender: "Male", address: "Barcelona", country: "Spain", city: "Barcelona", remote_photo_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/j1kt7zpoasrxus5aym8i.jpg")
francois = User.create!(current_sign_in_at: DateTime.new(2019, [7, 8, 8, 8, 8].sample, rand(1..28)), intro: "amazing coding bootcamp student", first_name: "Francois", last_name: "Adrien", email: "francois@gmail.com", password: "francois123", age: 25, gender: "Male", address: "Barcelona", country: "Spain", city: "Barcelona", remote_photo_url: "https://avatars3.githubusercontent.com/u/52235257?v=4")
glen = User.create!(current_sign_in_at: DateTime.new(2019, [7, 8, 8, 8, 8].sample, rand(1..28)), intro: "amazing coding bootcamp student", first_name: "Glen", last_name: "Warren", email: "glen@gmail.com", password: "glen123", age: 25, gender: "Male", address: "Barcelona", country: "Spain", city: "Barcelona", remote_photo_url: "https://avatars3.githubusercontent.com/u/44340845?v=4")
jaime = User.create!(current_sign_in_at: DateTime.new(2019, [7, 8, 8, 8, 8].sample, rand(1..28)), intro: "amazing coding bootcamp student", first_name: "Jaime", last_name: "Cruz", email: "jaime@gmail.com", password: "jaime123", age: 25, gender: "Male", address: "Madrid", country: "Spain", city: "Madrid", remote_photo_url: "https://avatars0.githubusercontent.com/u/39839800?v=4")
josephine = User.create!(current_sign_in_at: DateTime.new(2019, [7, 8, 8, 8, 8].sample, rand(1..28)), intro: "amazing coding bootcamp student", first_name: "Josephine", last_name: "Geoghegan", email: "josephine@gmail.com", password: "josephine123", age: 25, gender: "Female", address: "Madrid", country: "Spain", city: "Madrid", remote_photo_url: "https://avatars2.githubusercontent.com/u/48995429?v=4")
kaveh = User.create!(current_sign_in_at: DateTime.new(2019, [7, 8, 8, 8, 8].sample, rand(1..28)), intro: "amazing coding bootcamp student", first_name: "Kaveh", last_name: "Jalilian", email: "kaveh@gmail.com", password: "kaveh123", age: 25, gender: "Male", address: "Madrid", country: "Spain", city: "Madrid", remote_photo_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/wnf628rqyln9aciahxcp.jpg")
maria = User.create!(current_sign_in_at: DateTime.new(2019, [7, 8, 8, 8, 8].sample, rand(1..28)), intro: "amazing coding bootcamp student", first_name: "Maria", last_name: "Manninen", email: "maria@gmail.com", password: "maria123", age: 25, gender: "Female", address: "Valencia", country: "Spain", city: "Valencia", remote_photo_url: "https://avatars1.githubusercontent.com/u/50732002?v=4")
matthis = User.create!(current_sign_in_at: DateTime.new(2019, [7, 8, 8, 8, 8].sample, rand(1..28)), intro: "amazing coding bootcamp student", first_name: "Matthis", last_name: "Parisot", email: "matthis@gmail.com", password: "matthis123", age: 25, gender: "Male", address: "Valencia", country: "Spain", city: "Valencia", remote_photo_url: "https://avatars1.githubusercontent.com/u/52250484?v=4")
mehdi = User.create!(current_sign_in_at: DateTime.new(2019, [7, 8, 8, 8, 8].sample, rand(1..28)), intro: "amazing coding bootcamp student", first_name: "Mehdi", last_name: "Idrissi Kaitouni", email: "mehdi@gmail.com", password: "mehdi123", age: 25, gender: "Male", address: "Valencia", country: "Spain", city: "Valencia", remote_photo_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/wi1aedmjvhykylpeywj1.jpg")
# nicolas = User.create!(current_sign_in_at: DateTime.new(2019, [7, 8, 8, 8, 8].sample, rand(1..28)), intro: "member of the cool car", first_name: "Nicolas", last_name: "Proto", email: "nicolas@gmail.com", password: "nicolas123", age: 25, gender: "Male", address: "Frankfurt", country: "Germany", city: "Frankfurt", remote_photo_url: "https://avatars0.githubusercontent.com/u/43278026?v=4")
nikita = User.create!(current_sign_in_at: DateTime.new(2019, [7, 8, 8, 8, 8].sample, rand(1..28)), intro: "amazing coding bootcamp student", first_name: "Nikita", last_name: "Bandarevich", email: "nikita@gmail.com", password: "nikita123", age: 25, gender: "Male", address: "Valencia", country: "Spain", city: "Valencia", remote_photo_url: "https://avatars2.githubusercontent.com/u/34006151?v=4")
sy = User.create!(current_sign_in_at: DateTime.new(2019, [7, 8, 8, 8, 8].sample, rand(1..28)), intro: "amazing coding bootcamp student", first_name: "Sy", last_name: "Rashid", email: "sy@gmail.com", password: "sy1234", age: 25, gender: "Male", address: "Frankfurt", country: "Germany", city: "Frankfurt", remote_photo_url: "https://avatars2.githubusercontent.com/u/6656014?v=4")
thomas = User.create!(current_sign_in_at: DateTime.new(2019, [7, 8, 8, 8, 8].sample, rand(1..28)), intro: "amazing coding bootcamp student", first_name: "Thomas", last_name: "Bonnet", email: "thomas@gmail.com", password: "thomas123", age: 25, gender: "Male", address: "Valencia", country: "Spain", city: "Valencia", remote_photo_url: "https://avatars3.githubusercontent.com/u/49944627?v=4")
uri = User.create!(current_sign_in_at: DateTime.new(2019, [7, 8, 8, 8, 8].sample, rand(1..28)), intro: "amazing coding bootcamp student", first_name: "Uri", last_name: "Serra", email: "uri@gmail.com", password: "uri123", age: 25, gender: "Male", address: "Barcelona", country: "Spain", city: "Barcelona", remote_photo_url: "https://avatars1.githubusercontent.com/u/50989100?v=4")
victor = User.create!(current_sign_in_at: DateTime.new(2019, [7, 8, 8, 8, 8].sample, rand(1..28)), intro: "amazing coding bootcamp student", first_name: "Victor", last_name: "Padilla", email: "victor@gmail.com", password: "victor123", age: 25, gender: "Male", address: "Barcelona", country: "Spain", city: "Barcelona", remote_photo_url: "https://avatars1.githubusercontent.com/u/51762154?v=4")
wendela = User.create!(current_sign_in_at: DateTime.new(2019, [7, 8, 8, 8, 8].sample, rand(1..28)), intro: "member of the cool car", first_name: "Wendela", last_name: "Lovgren", email: "wendela@gmail.com", password: "wendela123", age: 25, gender: "Female", address: "Frankfurt", country: "Germany", city: "Frankfurt", remote_photo_url: "https://avatars1.githubusercontent.com/u/48654392?v=4")
xinyi = User.create!(current_sign_in_at: DateTime.new(2019, [7, 8, 8, 8, 8].sample, rand(1..28)), intro: "amazing coding bootcamp student", first_name: "Xinyi", last_name: "Wu", email: "xinyi@gmail.com", password: "xinyi123", age: 25, gender: "Female", address: "Frankfurt", country: "Germany", city: "Frankfurt", remote_photo_url: "https://avatars2.githubusercontent.com/u/51039948?v=4")
zach = User.create!(current_sign_in_at: DateTime.new(2019, [7, 8, 8, 8, 8].sample, rand(1..28)), intro: "amazing coding bootcamp student", first_name: "Zach", last_name: "Alvstad", email: "zach@gmail.com", password: "zach123", age: 25, gender: "Male", address: "Barcelona", country: "Spain", city: "Barcelona", remote_photo_url: "https://avatars3.githubusercontent.com/u/52245667?v=4")

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
#   User.create!(first_name: fn, last_name: ln, email: "#{fn}#{ln}@gmail.com", password: "#{fn}#{ln}123", age: 30, gender: gender, address: ["Barcelona", "Madrid"].sample, country: "Spain", city: ["Barcelona", "Madrid"].sample)
# end

User.all.each do |user|
  user.mark_user_visited!
end

puts "---------------------------------------------------"

puts "Finish users!"

puts "---------------------------------------------------"

puts "Creating connections, meetings, messages..."

puts "---------------------------------------------------"

dk = Connection.create(sender: danko, receiver: khoa, status: "buddied", score: 100)
km = Connection.create(sender: khoa, receiver: melissa, status: "buddied", score: 80)
dm = Connection.create(sender: danko, receiver: melissa, status: "buddied", score: 80)
ma = Connection.create(sender: melissa, receiver: arman, status: "buddied", score: 80)
wm = Connection.create(sender: wendela, receiver: melissa, status_sender: "buddy_requested", status: "buddy_requested", score: 87)
mb = Connection.create(sender: melissa, receiver: barbara, status: "buddy_requested", status_sender: "buddy_requested", score: 83)
me = Connection.create(sender: melissa, receiver: ellyn, status_sender: "buddy_requested", status: "buddy_requested", score: 95)
am = Connection.create(sender: amine, receiver: melissa, status_sender: "buddy_requested", status: "buddy_requested", score: 67)

Message.create(content: "Hi, I'm Danko - master of JavaScript and jQuery!", connection: dk, user: danko)
Message.create(content: "Weren't you the guy mistaken string interpolation of JS as jQuery symbol :P", connection: dk, user: khoa)
Message.create(content: "Wow, you mock me now", connection: dk, user: danko)
Message.create(content: "Hehe :>", connection: dk, user: khoa)

Message.create(content: "Hi I am Khoa :\">", connection: km, user: khoa)
Message.create(content: "Ohhhhh Khoa, how are you?", connection: km, user: melissa)
Message.create(content: "You want to hang out this weekend?", connection: km, user: melissa)
Message.create(content: "Sure, you like coding?", connection: km, user: khoa)
Message.create(content: "Yeah, let's meet up", connection: km, user: melissa)
Message.create(content: "Maybe Saturday?", connection: km, user: melissa)

Message.create(content: "Hi Danko", connection: dm, user: melissa)
Message.create(content: "Hi Melissa!!", connection: dm, user: danko)

Message.create(content: "Hi Barbara, I really like crossfit, too. But I'm new to Barcelona. Do you know a nice place?", connection: mb, user: melissa)
Message.create(content: "Hey Melissa, nice to meet you here! I like Alphalink. You can join some time!", connection: mb, user: barbara)
Message.create(content: "I'm planning to go tomorrow night at 7pm, do you want to join?", connection: mb, user: barbara)
Message.create(content: "I'd love to. Shall we just meet there?", connection: mb, user: melissa)
Message.create(content: "Yes perfect! See you there!", connection: mb, user: barbara)

Message.create(content: "Hej Melissa, I saw you like electronic music. Have you been to brunch in the park?", connection: wm, user: wendela)
Message.create(content: "Hi Wendela, yes I have. I really loved FatboySlim last weekend. It was sooo fun!", connection: wm, user: melissa)
Message.create(content: "Yes, it was soooo cool!", connection: wm, user: wendela)
Message.create(content: "I really like outdoor dance events in the summer! Barcelona is the best place for that!", connection: wm, user: wendela)
Message.create(content: "You're so right, but I really want to check out other places too.", connection: wm, user: melissa)
Message.create(content: "There is this outdoor club in Montjuïc, have you been?", connection: wm, user: melissa)
Message.create(content: "No, I don't know it.", connection: wm, user: wendela)
Message.create(content: "We should go to together! I'm going to send you a buddyUp request!", connection: wm, user: wendela)


Meeting.create(connection: dk, location: "Barcelona", date: Date.new(2019, 9, rand(1..30)))
Meeting.create(connection: km, location: "Berlin", date: Date.new(2019, 9, rand(1..30)))
Meeting.create(connection: dm, location: "Madrid", date: Date.new(2019, 9, rand(1..30)))
Meeting.create(connection: ma, location: "Barcelona", date: Date.new(2019, 9, rand(1..30)))

puts "Finish connections, meetings and messages!"

puts "---------------------------------------------------"

puts "Creating user responses..."

puts "---------------------------------------------------"

categories = [music_question, sport_question, movie_question, technical_question, entrepreneur_question, show_question]

# User.all.each do |user|
#   personality_question.responses.sample(rand(3..5)).each do |ur|
#     UserResponse.create(user: user, response: ur)
#   end
#   lifestyle_question.responses.sample(rand(3..5)).each do |ur|
#     UserResponse.create(user: user, response: ur)
#   end
#   categories.each do |category|
#     category.responses.sample(rand(0..5)).each do |ur|
#       UserResponse.create(user: user, response: ur)
#     end
#   end
# end

UserResponse.create(user: melissa, response_id: 103)
UserResponse.create(user: barbara, response_id: 103)

UserResponse.create(user: melissa, response_id: 61)
UserResponse.create(user: wendela, response_id: 61)

User.all.each do |user|
  # Music
  # Pop, R&B
  # Random between Asian pop, Indie
  # Random between Classical, Folk
  [74, 76, [56, 66].sample, [58, 62].sample].each do |r|
    UserResponse.create(user: user, response_id: r)
  end
  # Sports
  # Badminton, Surfing
  # Random between Baseball, Football
  # Random between Golf, Swimming
  [83, 113, [84, 94].sample, [96, 114].sample].each do |r|
    UserResponse.create(user: user, response_id: r)
  end
  # Movies
  # Comedy
  # Random between Animation, Thriller
  # Random between Horror, Mystery
  [123, [122, 136].sample, [129, 130].sample].each do |r|
    UserResponse.create(user: user, response_id: r)
  end
  # TV show
  # The Big Bang Theory
  # Random between Survivor, Big Brother
  [177, [183, 184].sample].each do |r|
    UserResponse.create(user: user, response_id: r)
  end
end

# Custom UserResponse of Personality and Lifestyle for user from each city.
User.where(address: "Barcelona").each do |user|
  # Cheerful, Creative, Enthusiastic
  # Random between Calm, Caring, Relaxed, Sociable
  [4, 6, 10, [2, 3, 22, 23].sample].each do |r|
    UserResponse.create(user: user, response_id: r)
  end
  # Adventurer, Art enthusiast, Pet lover
  # Random between Athlete, Culture Enthusiast, Family person, Traveller
  [25, 26, 44, [27, 32, 36, 50].sample].each do |r|
    UserResponse.create(user: user, response_id: r)
  end
end

User.where(address: "Madrid").each do |user|
  # Active, Determined, Friendly
  # Random between Fun, Optimistic, Organized, Passionate
  [1, 7, 12, [13, 16, 17, 18].sample].each do |r|
    UserResponse.create(user: user, response_id: r)
  end
  # Adventurer, Art enthusiast, Pet lover
  # Random between Athlete, Culture Enthusiast, Family person, Traveller
  [25, 26, 44, [27, 32, 36, 50].sample].each do |r|
    UserResponse.create(user: user, response_id: r)
  end
end

User.where(address: "Frankfurt").each do |user|
  # Enthusiastic, Organized, Relaxed
  # Random between Easygoing, Empathetic, Practical, Proactive
  [10, 17, 22, [8, 9, 19, 20].sample].each do |r|
    UserResponse.create(user: user, response_id: r)
  end
  # Adventurer, Art enthusiast, Pet lover
  # Random between Athlete, Culture Enthusiast, Family person, Traveller
  [25, 26, 44, [27, 32, 36, 50].sample].each do |r|
    UserResponse.create(user: user, response_id: r)
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
