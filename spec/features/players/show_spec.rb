require 'rails_helper'

RSpec.describe 'player show page', type: :feature do
#User story 4
  it 'can see the player with that id' do
    coav = Team.create!(name: "Colorado Avalanche", roster_spots: 23, full_roster: true)
    coav.players.create!(fname: "Nathan", lname: "MacKinnon", jersey: 29, healthy: true)
    coav.players.create!(fname: "Gabriel", lname: "Landeskog", jersey: 92, healthy: true)

    visit "/players/#{coav.players.first.id}"
    # save_and_open_page
    expect(page).to have_content("Name: Nathan MacKinnon")
    expect(page).to have_content("Jersey: 29")
    expect(page).to have_content("Healthy: true")
  end

end