# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'CREATING ROLES'
Role.create([
  { :name => 'admin' },
  { :name => 'free' },
  { :name => 'standard' },
  { :name => 'unlimited' }
], :without_protection => true)
puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :name => 'Gerardo Acuna', :email => 'user@example.com', :password => 'please', :password_confirmation => 'please'
user.add_role :admin
puts 'New user created: ' << user.name
user2 = User.create! :name => 'Second User', :email => 'user2@example.com', :password => 'please', :password_confirmation => 'please'
user2.add_role :free
puts 'New user created: ' << user2.name
user3 = User.create! :name => 'Third User', :email => 'user3@example.com', :password => 'please', :password_confirmation => 'please'
user3.add_role :standard
puts 'New user created: ' << user3.name
user4 = User.create! :name => 'Fourth User', :email => 'user4@example.com', :password => 'please', :password_confirmation => 'please'
user4.add_role :unlimited
puts 'New user created: ' << user4.name
