# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.new(first_name: "Alexandre", last_name: "Araujo", email: "alexandre@araujo.me", password: "123456")
User.destroy_all
Contact.destroy_all
Type.destroy_all

User.create!(email: "alexandre@araujo.me", password: "123456")
User.create!(email: "simony@araujo.me", password: "123456")

Contact.create!(user_id: User.first.id, first_name: "Simony", last_name: "Alcantara")
Contact.create!(user_id: User.first.id, first_name: "André", last_name: "Araujo")
Contact.create!(user_id: User.first.id, first_name: "Carina", last_name: "Carvalho")

Contact.create!(user_id: User.last.id, first_name: "Irandir", last_name: "Alcantara")
Contact.create!(user_id: User.last.id, first_name: "Estela", last_name: "Alcantara")
Contact.create!(user_id: User.last.id, first_name: "Jake", last_name: "Dog")

Type.create!(name: "Message", icon: "fa-comments")
Type.create!(name: "Meeting", icon: "fa-calendar-day")
Type.create!(name: "Other", icon: "fa-question-circle")
Type.create!(name: "Phone", icon: "fa-phone-square")


