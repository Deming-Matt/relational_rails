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

end
