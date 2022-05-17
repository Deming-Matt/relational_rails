require 'rails_helper'

RSpec.describe "new teams player", type: :feature do
  #user story 13
  it "adds a create player link on the team's players page" do
    coav = Team.create!(name: "Colorado Avalanche", roster_spots: 23, full_roster: true)
    visit "/teams/#{coav.id}/players"
    click_link "Add Player"

    expect(current_path).to eq("teams/#{coav.id}/players/new")
    # expect(page).to have_selector("form", method: :post)
    fill_in "First Name", with: "Patrick"
    fill_in "Last Name", with: "Roy"
    fill_in "Jersey", with: "29"
    fill_in "Healthy", with: "true"
    click_button "Add Player"

    expect(current_path).to eq("/teams/#{coav.id}/players")
    expect(page).to have_content("Patrick Roy")
  end
end
