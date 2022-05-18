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

end
