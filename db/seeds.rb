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
coav.players.create!(fname: "Nathan", lname: "MacKinnon", jersey: 29, healthy: true)
coav.players.create!(fname: "Gabriel", lname: "Landeskog", jersey: 92, healthy: true)
coav.players.create!(fname: "Darcy", lname: "Kuemper", jersey: 35, healthy: false)
coav.players.create!(fname: "Jack", lname: "Johnson", jersey: 3, healthy: true)
derw = Team.create!(name: "Detriot Red Wings", roster_spots: 22, full_roster: false)
derw.players.create!(fname: "Magnus", lname: "Hellberg", jersey: 45, healthy: true)
derw.players.create!(fname: "Marc", lname: "Staal", jersey: 18, healthy: false)
derw.players.create!(fname: "Givani", lname: "Smith", jersey: 48, healthy: true)
derw.players.create!(fname: "Dylan", lname: "Larkin", jersey: 71, healthy: true)
stlb = Team.create!(name: "St. Louis Blues", roster_spots: 21, full_roster: false)
stlb.players.create!(fname: "Ville", lname: "Husso", jersey: 35, healthy: false)
stlb.players.create!(fname: "Colton", lname: "Parayko", jersey: 55, healthy: true)
stlb.players.create!(fname: "Torey", lname: "Krug", jersey: 47, healthy: true)
stlb.players.create!(fname: "Ryan", lname: "O'Reilly", jersey: 90, healthy: true)
miwi = Team.create!(name: "Minnesota Wild", roster_spots: 23, full_roster: true)
miwi.players.create!(fname: "Cam", lname: "Tabot", jersey: 33, healthy: true)
miwi.players.create!(fname: "Jared", lname: "Spurgeon", jersey: 46, healthy: true)
miwi.players.create!(fname: "Marcus", lname: "Foligno", jersey: 17, healthy: false)
miwi.players.create!(fname: "Nick", lname: "Bjugstad", jersey: 27, healthy: true)
sajs = Team.create!(name: "San Jose Sharks", roster_spots: 20, full_roster: false)
sajs.players.create!(fname: "Adin", lname: "Hill", jersey: 33, healthy: true)
sajs.players.create!(fname: "Erik", lname: "Karisson", jersey: 65, healthy: false)
sajs.players.create!(fname: "Logan", lname: "Couture", jersey: 39, healthy: true)
sajs.players.create!(fname: "Rudolfs", lname: "Balcers", jersey: 92, healthy: false)
waca = Team.create!(name: "Washington Capitals", roster_spots: 23, full_roster: true)
waca.players.create!(fname: "Phoenix", lname: "Copley", jersey: 1, healthy: true)
waca.players.create!(fname: "John", lname: "Carlson", jersey: 74, healthy: false)
waca.players.create!(fname: "Alex", lname: "Overchkin", jersey: 8, healthy: true)
waca.players.create!(fname: "Nic", lname: "Dowd", jersey: 26, healthy: true)
dast = Team.create!(name: "Dallas Stars", roster_spots: 19, full_roster: false)
dast.players.create!(fname: "Jake", lname: "Oettinger", jersey: 29, healthy: true)
dast.players.create!(fname: "Thomas", lname: "Harley", jersey: 55, healthy: false)
dast.players.create!(fname: "Jamie", lname: "Benn", jersey: 14, healthy: false)
dast.players.create!(fname: "Riley", lname: "Damiani", jersey: 13, healthy: true)
