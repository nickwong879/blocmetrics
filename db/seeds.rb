# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

# Create users
5.times do
	user = User.new(
		name: Faker::Name.name,
		email:  Faker::Internet.email,
		password:  Faker::Lorem.characters(10)
		)
	user.save!
end
users = User.all

# Create applications
10.times do
	Application.create!(
		name: Faker::Company.name,
		URL: Faker::Internet.domain_name,
		summary:  Faker::Lorem.sentence 
		)
end
applications = Application.all

# Create events

30.times do
	Event.create!(
		name: 'Login',
		application: applications.sample
		)
end

30.times do
	Event.create!(
		name: 'Logout',
		application: applications.sample
		)
end

30.times do
	Event.create!(
		name: 'Placed order',
		application: applications.sample
		)
end

30.times do
	Event.create!(
		name: 'Request submitted',
		application: applications.sample
		)
end

30.times do
	Event.create!(
		name: 'Feedback submitted',
		application: applications.sample
		)
end

events = Event.all

# report upon completion
puts "Seed finished"
puts "#{User.count} users created"
puts "#{Application.count} applications created"
puts "#{Event.count} events created"