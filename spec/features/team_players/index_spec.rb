require 'rails_helper'

RSpec.describe 'team_players_index', type: :feature do
  #User story 5
  it 'can show each player that is associated with that team' do
    coav = Team.create!(name: "Colorado Avalanche", roster_spots: 23, full_roster: true)
    coav.players.create!(fname: "Nathan", lname: "MacKinnon", jersey: 29, healthy: true)
    coav.players.create!(fname: "Gabriel", lname: "Landeskog", jersey: 92, healthy: true)
    coav.players.create!(fname: "Darcy", lname: "Kuemper", jersey: 35, healthy: false)
    coav.players.create!(fname: "Jack", lname: "Johnson", jersey: 3, healthy: true)

    visit "/teams/#{coav.id}/players"

    expect(page).to have_content("Name: Nathan MacKinnon")
    expect(page).to have_content("Name: Gabriel Landeskog")
    expect(page).to have_content("Jersey: 35")
    expect(page).to have_content("Jersey: 92")
    expect(page).to have_content("Healthy: true")
    expect(page).to have_content("Healthy: false")
  end

  #User Story 10
  it 'show the players page for a link on that teams show page' do
    coav = Team.create!(name: "Colorado Avalanche", roster_spots: 23, full_roster: true)
    coav.players.create!(fname: "Nathan", lname: "MacKinnon", jersey: 29, healthy: true)
    coav.players.create!(fname: "Gabriel", lname: "Landeskog", jersey: 92, healthy: true)
    coav.players.create!(fname: "Darcy", lname: "Kuemper", jersey: 35, healthy: false)
    coav.players.create!(fname: "Jack", lname: "Johnson", jersey: 3, healthy: true)

    visit "/teams/#{coav.id}" #show page: need link on the show page!

    click_link "#{coav.name} Players"
    expect(current_path).to eq("/teams/#{coav.id}/players")
  end
end
