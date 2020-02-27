require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Detroy all data..."
User.destroy_all
puts "Users destroyed"
Contact.destroy_all
puts "Contacts destroyed"
Type.destroy_all
puts "Types destroyed"
Event.destroy_all
puts "Events destroyed"
puts ""

type_id = []
@type = Type.create!(name: "Message", icon: "fa-comments")
type_id << @type.id
@type = Type.create!(name: "Meeting", icon: "fa-calendar-day")
type_id << @type.id
@type = Type.create!(name: "Other", icon: "fa-question-circle")
type_id << @type.id
@type = Type.create!(name: "Phone", icon: "fa-phone-square")
type_id << @type.id

@user = User.create!(email: "test_a@gmail.com", password: "123456")
puts "Created user #{@user.email}"
rand(35..50).times do
    @contact = Contact.create!(user_id: @user.id, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name )
    puts "Created contact #{@contact.id}"
    rand(10..20).times do
        @event = Event.create!(user_id: @user.id, contact_id: @contact.id,type_id: type_id[rand(0..3)], note: Faker::Lorem.paragraph_by_chars(number: rand(30..256), supplemental: false))
        puts "Created event #{@event.id} to the contact #{@contact.id}"
    end
    puts ""
end

@user = User.create!(email: "test_b@gmail.com", password: "123456")
puts "Created user #{@user.email}"
rand(35..50).times do
    @contact = Contact.create!(user_id: @user.id, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name )
    puts "Created contact #{@contact.id}"
    rand(10..20).times do
        @event = Event.create!(user_id: @user.id, contact_id: @contact.id,type_id: type_id[rand(0..3)], note: Faker::Lorem.paragraph_by_chars(number: rand(30..256), supplemental: false))
        puts "Created event #{@event.id} to the contact #{@contact.id}"
    end
    puts ""
end

