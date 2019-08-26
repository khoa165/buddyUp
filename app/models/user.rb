class User < ApplicationRecord
  # Constants
  GENDERS = ["Male", "Female", "Others", "Prefer not to say"]
  OCCUPATIONS = ["Accountant", "Actor", "Actress", "Actuary", "Advisor", "Aide", "Ambassador", "Animator", "Archer", "Artist", "Astronaut", "Astronomer", "Athlete", "Attorney", "Auctioneer", "Author", "Babysitter", "Baker", "Ballerina", "Banker", "Barber", "Baseball player", "Basketball player", "Bellhop", "Biologist", "Blacksmith", "Bookkeeper", "Bowler", "Builder", "Butcher", "Butler", "Cab driver", "Calligrapher", "Captain", "Cardiologist", "Caregiver", "Carpenter", "Cartographer", "Cartoonist", "Cashier", "Catcher", "Caterer", "Cellist", "Chaplain", "Chauffeur", "Chef", "Chemist", "Clergyman", "Clergywoman", "Clerk", "Coach", "Cobbler", "Composer", "Concierge", "Consul", "Consultant", "Contractor", "Cook", "Cop", "Coroner", "Courier", "Cryptographer", "Custodian", "Dancer", "Dentist", "Deputy", "Dermatologist", "Designer", "Detective", "Dictator", "Director", "Disc jockey", "Diver", "Doctor", "Doorman", "Driver", "Drummer", "Dry cleaner", "Ecologist", "Economist", "Editor", "Educator", "Electrician", "Emperor", "Empress", "Engineer", "Entertainer", "Entomologist", "Entrepreneur", "Executive", "Explorer", "Exporter", "Exterminator", "Falconer", "Farmer", "Financier", "Firefighter", "Fisherman", "Flutist", "Football player", "Foreman", "Game designer", "Garbage man", "Gardener", "Gatherer", "Gemcutter", "General", "Geneticist", "Geographer", "Geologist", "Golfer", "Governor", "Grocer", "Guider", "Hairdresser", "Handyman", "Harpist", "Highway patrol", "Hobo", "Hunter", "Illustrator", "Importer", "Inspector", "Instructor", "Intern", "Internist", "Interpreter", "Inventor", "Investigator", "Investor", "Jailer", "Janitor", "Jester", "Jeweler", "Jockey", "Journalist", "Judge", "Karate teacher", "Laborer", "Landlord", "Landscaper", "Laundress", "Lawyer", "Lecturer", "Legal aide", "Librarian", "Librettist", "Lifeguard", "Linguist", "Lobbyist", "Locksmith", "Lyricist", "Magician", "Maid", "Mail carrier", "Manager", "Manufacturer", "Marine", "Marketer", "Mason", "Mathematician", "Mayor", "Mechanic", "Messenger", "Midwife", "Miner", "Model", "Monk", "Muralist", "Musician", "Navigator", "Negotiator", "Notary", "Novelist", "Nun", "Nurse", "Oboist", "Operator", "Ophthalmologist", "Optician", "Oracle", "Orderly", "Ornithologist", "Painter", "Paleontologist", "Paralegal", "Park ranger", "Pathologist", "Pawnbroker", "Peddler", "Pediatrician", "Percussionist", "Performer", "Pharmacist", "Philanthropist", "Philosopher", "Photographer", "Physician", "Physicist", "Pianist", "Pilot", "Pitcher", "Plumber", "Poet", "Police", "Policeman", "Policewoman", "Politician", "President", "Prince", "Princess", "Principal", "Producer", "Product manager", "Professor", "Programmer", "Psychiatrist", "Psychologist", "Publisher", "Quarterback", "Quilter", "Radiologist", "Rancher", "Ranger", "Real estate agent", "Receptionist", "Referee", "Registrar", "Reporter", "Representative", "Researcher", "Restaurateur", "Retailer", "Retiree", "Sailor", "Salesperson", "Samurai", "Saxophonist", "Scholar", "Scientist", "Scout", "Scuba diver", "Seamstress", "Security guard", "Senator", "Sheriff", "Singer", "Smith", "Socialite", "Soldier", "Software developer", "Spy", "Star", "Statistician", "Stockbroker", "Street sweeper", "Student", "Surgeon", "Surveyor", "Swimmer", "Tailor", "Tax collector", "Taxi driver", "Taxidermist", "Teacher", "Technician", "Tennis player", "Test pilot", "Tiler", "Toolmaker", "Trader", "Trainer", "Translator", "Trash collector", "Travel agent", "Treasurer", "Truck driver", "Tutor", "Typist", "Umpire", "Undertaker", "Usher", "Valet", "Veteran", "Veterinarian", "Vicar", "Violinist", "Waiter", "Waitress", "Warden", "Warrior", "Watchmaker", "Weaver", "Web developer", "Welder", "Woodcarver", "Workman", "Wrangler", "Writer", "Xylophonist", "Yodeler", "Zookeeper", "Zoologist"]
  COUNTRIES = ["United States of America", "Afghanistan", "Albania", "Algeria", "Andorra", "Angola", "Antigua & Deps", "Argentina", "Armenia", "Australia", "Austria", "Azerbaijan", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bhutan", "Bolivia", "Bosnia Herzegovina", "Botswana", "Brazil", "Brunei", "Bulgaria", "Burkina", "Burma", "Burundi", "Cambodia", "Cameroon", "Canada", "Cape Verde", "Central African Rep", "Chad", "Chile", "People's Republic of China", "Republic of China", "Colombia", "Comoros", "Democratic Republic of the Congo", "Republic of the Congo", "Costa Rica", "Croatia", "Cuba", "Cyprus", "Czech Republic", "Danzig", "Denmark", "Djibouti", "Dominica", "Dominican Republic", "East Timor", "Ecuador", "Egypt", "El Salvador", "Equatorial Guinea", "Eritrea", "Estonia", "Ethiopia", "Fiji", "Finland", "France", "Gabon", "Gaza Strip", "The Gambia", "Georgia", "Germany", "Ghana", "Greece", "Grenada", "Guatemala", "Guinea", "Guinea-Bissau", "Guyana", "Haiti", "Holy Roman Empire", "Honduras", "Hungary", "Iceland", "India", "Indonesia", "Iran", "Iraq", "Republic of Ireland", "Israel", "Italy", "Ivory Coast", "Jamaica", "Japan", "Jonathanland", "Jordan", "Kazakhstan", "Kenya", "Kiribati", "North Korea", "South Korea", "Kosovo", "Kuwait", "Kyrgyzstan", "Laos", "Latvia", "Lebanon", "Lesotho", "Liberia", "Libya", "Liechtenstein", "Lithuania", "Luxembourg", "Macedonia", "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Marshall Islands", "Mauritania", "Mauritius", "Mexico", "Micronesia", "Moldova", "Monaco", "Mongolia", "Montenegro", "Morocco", "Mount Athos", "Mozambique", "Namibia", "Nauru", "Nepal", "Newfoundland", "Netherlands", "New Zealand", "Nicaragua", "Niger", "Nigeria", "Norway", "Oman", "Ottoman Empire", "Pakistan", "Palau", "Panama", "Papua New Guinea", "Paraguay", "Peru", "Philippines", "Poland", "Portugal", "Prussia", "Qatar", "Romania", "Rome", "Russian Federation", "Rwanda", "St Kitts & Nevis", "St Lucia", "Saint Vincent & the", "Grenadines", "Samoa", "San Marino", "Sao Tome & Principe", "Saudi Arabia", "Senegal", "Serbia", "Seychelles", "Sierra Leone", "Singapore", "Slovakia", "Slovenia", "Solomon Islands", "Somalia", "South Africa", "Spain", "Sri Lanka", "Sudan", "Suriname", "Swaziland", "Sweden", "Switzerland", "Syria", "Tajikistan", "Tanzania", "Thailand", "Togo", "Tonga", "Trinidad & Tobago", "Tunisia", "Turkey", "Turkmenistan", "Tuvalu", "Uganda", "Ukraine", "United Arab Emirates", "United Kingdom", "Uruguay", "Uzbekistan", "Vanuatu", "Vatican City", "Venezuela", "Vietnam", "Yemen", "Zambia", "Zimbabwe"]

  # Associations
  has_many :user_responses, dependent: :destroy
  has_many :messages
  before_destroy :destroy_connections

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :user_responses, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :photo, PhotoUploader

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def connections
    Connection.where("receiver_id = #{id} OR sender_id = #{id}")
  end

  def meetings
    connections = Connection.where("receiver_id = #{id} OR sender_id = #{id}")
    meetings = []
    connections.each do |connection|
      connection.meetings.each do |meeting|
        meetings << meeting
      end
    end
    meetings
  end

  def new_user?
    first_time_visit
  end

  def mark_user_visited
    first_time_visit = false
  end

  def in_session?
    in_session
  end

  def begin_session
    update(in_session: true)
  end

  def cancel_session
    update(in_session: false)
  end

  private

  def destroy_connections
    connections.destroy_all
  end
end
