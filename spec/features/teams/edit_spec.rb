require 'rails_helper'

#User story 12
RSpec.describe 'update parent class', type: :feature do
  it 'can update a parent item' do
    coav = Team.create!(name: "Colorado Avalanche", roster_spots: 23, full_roster: true)
    visit "/teams/#{coav.id}"
    click_link "Update Team"

    expect(current_path).to eq("/teams/#{coav.id}/edit")

    fill_in "Name", with: "Florida Panthers"
    fill_in "Roster spots", with: "22"
    fill_in "Full roster", with: "false"
    click_on "Update"

    expect(current_path).to eq("/teams/#{coav.id}")
    expect(page).to have_content("Florida Panthers")
  end
end
