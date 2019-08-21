class User < ApplicationRecord
  # Constants
  GENDERS = ["Male", "Female", "Others", "Prefer not to say"]
  OCCUPATIONS = ["Accountant", "Actor", "Actress", "Actuary", "Advisor", "Aide", "Ambassador", "Animator", "Archer", "Artist", "Astronaut", "Astronomer", "Athlete", "Attorney", "Auctioneer", "Author", "Babysitter", "Baker", "Ballerina", "Banker", "Barber", "Baseball player", "Basketball player", "Bellhop", "Biologist", "Blacksmith", "Bookkeeper", "Bowler", "Builder", "Butcher", "Butler", "Cab driver", "Calligrapher", "Captain", "Cardiologist", "Caregiver", "Carpenter", "Cartographer", "Cartoonist", "Cashier", "Catcher", "Caterer", "Cellist", "Chaplain", "Chauffeur", "Chef", "Chemist", "Clergyman", "Clergywoman", "Clerk", "Coach", "Cobbler", "Composer", "Concierge", "Consul", "Consultant", "Contractor", "Cook", "Cop", "Coroner", "Courier", "Cryptographer", "Custodian", "Dancer", "Dentist", "Deputy", "Dermatologist", "Designer", "Detective", "Dictator", "Director", "Disc jockey", "Diver", "Doctor", "Doorman", "Driver", "Drummer", "Dry cleaner", "Ecologist", "Economist", "Editor", "Educator", "Electrician", "Emperor", "Empress", "Engineer", "Entertainer", "Entomologist", "Entrepreneur", "Executive", "Explorer", "Exporter", "Exterminator", "Falconer", "Farmer", "Financier", "Firefighter", "Fisherman", "Flutist", "Football player", "Foreman", "Game designer", "Garbage man", "Gardener", "Gatherer", "Gemcutter", "General", "Geneticist", "Geographer", "Geologist", "Golfer", "Governor", "Grocer", "Guider", "Hairdresser", "Handyman", "Harpist", "Highway patrol", "Hobo", "Hunter", "Illustrator", "Importer", "Inspector", "Instructor", "Intern", "Internist", "Interpreter", "Inventor", "Investigator", "Investor", "Jailer", "Janitor", "Jester", "Jeweler", "Jockey", "Journalist", "Judge", "Karate teacher", "Laborer", "Landlord", "Landscaper", "Laundress", "Lawyer", "Lecturer", "Legal aide", "Librarian", "Librettist", "Lifeguard", "Linguist", "Lobbyist", "Locksmith", "Lyricist", "Magician", "Maid", "Mail carrier", "Manager", "Manufacturer", "Marine", "Marketer", "Mason", "Mathematician", "Mayor", "Mechanic", "Messenger", "Midwife", "Miner", "Model", "Monk", "Muralist", "Musician", "Navigator", "Negotiator", "Notary", "Novelist", "Nun", "Nurse", "Oboist", "Operator", "Ophthalmologist", "Optician", "Oracle", "Orderly", "Ornithologist", "Painter", "Paleontologist", "Paralegal", "Park ranger", "Pathologist", "Pawnbroker", "Peddler", "Pediatrician", "Percussionist", "Performer", "Pharmacist", "Philanthropist", "Philosopher", "Photographer", "Physician", "Physicist", "Pianist", "Pilot", "Pitcher", "Plumber", "Poet", "Police", "Policeman", "Policewoman", "Politician", "President", "Prince", "Princess", "Principal", "Producer", "Product manager", "Professor", "Programmer", "Psychiatrist", "Psychologist", "Publisher", "Quarterback", "Quilter", "Radiologist", "Rancher", "Ranger", "Real estate agent", "Receptionist", "Referee", "Registrar", "Reporter", "Representative", "Researcher", "Restaurateur", "Retailer", "Retiree", "Sailor", "Salesperson", "Samurai", "Saxophonist", "Scholar", "Scientist", "Scout", "Scuba diver", "Seamstress", "Security guard", "Senator", "Sheriff", "Singer", "Smith", "Socialite", "Soldier", "Software developer", "Spy", "Star", "Statistician", "Stockbroker", "Street sweeper", "Student", "Surgeon", "Surveyor", "Swimmer", "Tailor", "Tax collector", "Taxi driver", "Taxidermist", "Teacher", "Technician", "Tennis player", "Test pilot", "Tiler", "Toolmaker", "Trader", "Trainer", "Translator", "Trash collector", "Travel agent", "Treasurer", "Truck driver", "Tutor", "Typist", "Umpire", "Undertaker", "Usher", "Valet", "Veteran", "Veterinarian", "Vicar", "Violinist", "Waiter", "Waitress", "Warden", "Warrior", "Watchmaker", "Weaver", "Web developer", "Welder", "Woodcarver", "Workman", "Wrangler", "Writer", "Xylophonist", "Yodeler", "Zookeeper", "Zoologist"]

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

  private

  def destroy_connections
    connections.destroy_all
  end
end
