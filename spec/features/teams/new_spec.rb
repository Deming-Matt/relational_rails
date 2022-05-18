require 'rails_helper'

RSpec.describe "new teams", type: :feature do
  #user story 11
  it "adds a create Team link, form, and redirect" do
  
    visit '/teams'
    click_link "New Team"

    expect(current_path).to eq('/teams/new')
    # expect(page).to have_selector("form", method: :post)
    fill_in "Name", with: "Chicago Blackhawks"
    fill_in "Roster spots", with: "23"
    fill_in "Full roster", with: "true"
    click_button "Create New Team"

    expect(current_path).to eq("/teams")
    expect(page).to have_content("Chicago Blackhawks")
  end
end
