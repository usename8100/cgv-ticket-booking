# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Create sample account
User.create!(name: "long test", email: "trinhminhlongad@gmail.com", password: "qweqwe", password_confirmation: "qweqwe",
			gender: true, phone_number: "0123456789",
			activated: true,
			activated_at: Time.zone.now)

User.create!(name: "long test", email: "mail@gmail.com", password: "qweqwe", password_confirmation: "qweqwe",
			gender: false, phone_number: "0123455789",
			activated: true,
			activated_at: Time.zone.now)
