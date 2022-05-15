# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Hockey teams
  #Roster size max = 23
Player.destroy_all
Team.destroy_all

coav = Team.create!(name: "Colorado Avalanche", roster_spots: 23, full_roster: true)
derw = Team.create!(name: "Detriot Red Wings", roster_spots: 22, full_roster: false)
stlb = Team.create!(name: "St. Louis Blues", roster_spots: 21, full_roster: false)
miwi = Team.create!(name: "Minnesota Wild", roster_spots: 23, full_roster: true)
sajs = Team.create!(name: "San Jose Sharks", roster_spots: 20, full_roster: false)
waca = Team.create!(name: "Washington Capitals", roster_spots: 23, full_roster: true)
dast = Team.create!(name: "Dallas Stars", roster_spots: 19, full_roster: false)

coav.players.create!(fname: "Nathan", lname: "MacKinnon", jersey: 29, healthy: true)
coav.players.create!(fname: "Gabriel", lname: "Landeskog", jersey: 92, healthy: true)
coav.players.create!(fname: "Darcy", lname: "Kuemper", jersey: 35, healthy: false)
coav.players.create!(fname: "Jack", lname: "Johnson", jersey: 3, healthy: true)
