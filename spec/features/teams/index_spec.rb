require 'rails_helper'

RSpec.describe 'team index page', type: :feature do
  #User Story 1, Parent Index
  it "can see the name of each team" do
    coav = Team.create!(name: "Colorado Avalanche", roster_spots: 23, full_roster: true)
    derw = Team.create!(name: "Detriot Red Wings", roster_spots: 22, full_roster: false)

    visit '/teams'

    expect(page).to have_content("Club: #{coav.name}")
    expect(page).to have_content("Club: #{derw.name}")
  end

  #User Story 2, Parent Show
  it "can see the attribute for teams" do
    
  end
end
