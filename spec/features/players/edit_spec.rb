require 'rails_helper'

RSpec.describe 'player show page', type: :feature do
  #user story 14
  it 'has a an update player link that can edit that player' do
    coav = Team.create!(name: "Colorado Avalanche", roster_spots: 23, full_roster: true)
    nathan = coav.players.create!(fname: "Natha", lname: "MacKinno", jersey: 239, healthy: true)

    visit "/players/#{nathan.id}"
    click_link "Update Player"

    expect(current_path).to eq("/players/#{nathan.id}/edit")

    fill_in "fname", with: "Nathan"
    fill_in "lname", with: "MacKinnon"
    fill_in "Jersey", with: "29"
    fill_in "Healthy", with: "true"
    click_on "Update"

    expect(current_path).to eq("/players/#{nathan.id}")
    expect(page).to have_content("Nathan MacKinnon")
    expect(page).to have_content("29")
    expect(page).to have_content("true")

  end
end
