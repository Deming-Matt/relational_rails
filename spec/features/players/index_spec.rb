require 'rails_helper'

RSpec.describe 'player index page', type: :feature do
  #User Story 3
  it 'can see all the players in the system' do
    coav = Team.create!(name: "Colorado Avalanche", roster_spots: 23, full_roster: true)
    coav.players.create!(fname: "Nathan", lname: "MacKinnon", jersey: 29, healthy: true)
    coav.players.create!(fname: "Gabriel", lname: "Landeskog", jersey: 92, healthy: true)

    visit '/players'

    expect(page).to have_content("Name: Nathan MacKinnon")
    expect(page).to have_content("Jersey Number: 29")
    expect(page).to have_content("Is he healthy? true")
  end

  #User Story 8
  it 'can click a player link and route to all players page' do
    coav = Team.create!(name: "Colorado Avalanche", roster_spots: 23, full_roster: true)
    coav.players.create!(fname: "Nathan", lname: "MacKinnon", jersey: 29, healthy: true)
    coav.players.create!(fname: "Gabriel", lname: "Landeskog", jersey: 92, healthy: true)

    visit '/teams'
    click_link "All Players"
    expect(page).to have_current_path('/players')

    visit "/teams/#{coav.id}"
    click_link "All Players"
    expect(page).to have_current_path('/players')

    visit "/players/#{coav.players.first.id}"
    click_link "All Players"
    expect(page).to have_current_path('/players')
  end

#user story 15
  it "can show a list of the players that are healthy" do
    coav = Team.create!(name: "Colorado Avalanche", roster_spots: 23, full_roster: true)
    nathan = coav.players.create!(fname: "Nathan", lname: "MacKinnon", jersey: 29, healthy: true)
    gabriel = coav.players.create!(fname: "Gabriel", lname: "Landeskog", jersey: 92, healthy: true)
    darcy = coav.players.create!(fname: "Darcy", lname: "Kuemper", jersey: 35, healthy: false)
    jack = coav.players.create!(fname: "Jack", lname: "Johnson", jersey: 3, healthy: true)

    visit "/players"

    expect(page).to_not have_content("Darcy Kuemper")
    expect(page).to have_content("Nathan MacKinnon")
    expect(page).to have_content("Jack Johnson")

  end
end
