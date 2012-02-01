# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all

User.create(first_name: 'Jay', last_name: 'Vana', username: 'jsvana', password: 'asdf', email: 'asdf@asdf.com')
User.create(first_name: 'Kaleb', last_name: 'Elwert', username: 'kelwert', password: 'asdf', email: 'asdf@asdf.com')
User.create(first_name: 'Josh', last_name: 'Lewis', username: 'jdlewis', password: 'asdf', email: 'asdf@asdf.com')
User.create(first_name: 'Steve', last_name: 'Jobs', username: 'stjobs', password: 'asdf', email: 'asdf@asdf.com')