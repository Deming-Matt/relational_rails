require 'rails_helper'

RSpec.describe 'team show page', type: :feature do
#User Story 2, Parent Show
  it "can see the attribute for teams" do
    coav = Team.create!(name: "Colorado Avalanche", roster_spots: 23, full_roster: true)
    derw = Team.create!(name: "Detriot Red Wings", roster_spots: 22, full_roster: false)

    visit "/teams/#{coav.id}"

    expect(page).to have_content("Club: #{coav.name}")
    expect(page).to have_content("Roster Spots Filled: #{coav.roster_spots}")
    expect(page).to have_content("Is their roster full? #{coav.full_roster}")
  end

  #user story 19
  it 'has a delete link, team is deleted along with all players' do
    coav = Team.create!(name: "Colorado Avalanche", roster_spots: 23, full_roster: true)
    coav.players.create!(fname: "Nathan", lname: "MacKinnon", jersey: 29, healthy: true)
    coav.players.create!(fname: "Gabriel", lname: "Landeskog", jersey: 92, healthy: true)
    coav.players.create!(fname: "Darcy", lname: "Kuemper", jersey: 35, healthy: false)
    coav.players.create!(fname: "Jack", lname: "Johnson", jersey: 3, healthy: true)
    visit "/teams"

    expect(page).to have_content("Colorado Avalanche")

    visit "/teams/#{coav.id}"
    click_link "Delete Team"

    expect(current_path).to eq("/teams")
    expect(page).to_not have_content("Colorado Avalanche")

    visit "/players"

    expect(page).to_not have_content("Nathan MacKinnon")
  end
end
