# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
khoa = User.create!(first_name: "Khoa", last_name: "Le", email: "khoa@gmail.com", password: "khoa123", )
danko = User.create!(first_name: "Danko", last_name: "Beribak", email: "danko@gmail.com", password: "danko123", )
arman = User.create!(first_name: "Arman", last_name: "Balani", email: "arman@gmail.com", password: "arman123", )
melissa = User.create!(first_name: "Melissa", last_name: "Lobuescher", email: "melissa@gmail.com", password: "melissa123", )

dk = Connection.create(sender: danko, receiver: khoa, status: "buddied")
km = Connection.create(sender: khoa, receiver: melissa, status: "buddied")
Connection.create(sender: danko, receiver: arman)
Connection.create(sender: danko, receiver: melissa)
Connection.create(sender: arman, receiver: melissa)
Connection.create(sender: arman, receiver: khoa)

Message.create(content: "Hello how are you?", connection: dk, user: danko)
Message.create(content: "I am fine thank you.", connection: dk, user: khoa)
Message.create(content: "What is your nickname.", connection: dk, user: danko)
Message.create(content: "Khoaqin", connection: dk, user: khoa)
Message.create(content: "Hi i am Khoa bear.", connection: km, user: khoa)
Message.create(content: "Nice to meet you.", connection: km, user: melissa)
Message.create(content: "I am Melissa.", connection: km, user: melissa)
Message.create(content: "I drink a loooot of coffe!!!", connection: km, user: melissa)
Message.create(content: "Yes you do.", connection: km, user: khoa)

Meeting.create(connection: dk, location: "Barcelona")
Meeting.create(connection: km, location: "Badalona")
