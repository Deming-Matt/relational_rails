require 'rails_helper'

RSpec.describe 'team_players_show', type: :feature do
#User Story 10
  it 'show the players page for a link on that teams show page' do
    coav = Team.create!(name: "Colorado Avalanche", roster_spots: 23, full_roster: true)
    coav.players.create!(fname: "Nathan", lname: "MacKinnon", jersey: 29, healthy: true)
    coav.players.create!(fname: "Gabriel", lname: "Landeskog", jersey: 92, healthy: true)
    coav.players.create!(fname: "Darcy", lname: "Kuemper", jersey: 35, healthy: false)
    coav.players.create!(fname: "Jack", lname: "Johnson", jersey: 3, healthy: true)

    visit "/teams/#{coav.id}"

    click_link "#{coav.name} Players"
    expect(current_path).to eq("/teams/#{coav.id}/players")
  end
end
