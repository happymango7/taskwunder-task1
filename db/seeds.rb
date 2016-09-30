# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
users = User.create([{
	admin: true,
	first_name: 'admin',
	last_name: 'web',
	email: 'admin@web.com',
	password: '12345678',
	bio: 'Administrator',
	date_of_birth: '2016-09-12'
}]);

puts "created #{users.count} users"