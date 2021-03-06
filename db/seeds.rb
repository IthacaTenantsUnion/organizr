# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'factory_bot_rails'
include FactoryBot::Syntax::Methods


User.destroy_all
Tenancy.destroy_all
Landlord.destroy_all
Unit.destroy_all

print "Landlords: "
25.times { print '.'; create(:landlord) }
@landlords = Landlord.all
puts ''

print "Ratings: "
100.times { print "."; create(:tenancy, :with_rating, landlord: @landlords.sample) }
puts ''

admin = create(:user, role: "admin", email: "admin@example.com", password: "abc123", password_confirmation: "abc123")