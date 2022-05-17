require 'rails_helper'

RSpec.describe "new teams", type: :feature do
  #user story 11
  it "adds a create Team link, form, and redirect" do
    #   As a visitor
    # When I visit the Parent Index page
    # Then I see a link to create a new Parent record, "New Parent"
    # When I click this link
    # Then I am taken to '/parents/new' where I  see a form for a new parent record
    # When I fill out the form with a new parent's attributes:
    # And I click the button "Create Parent" to submit the form
    # Then a `POST` request is sent to the '/parents' route,
    # a new parent record is created,
    # and I am redirected to the Parent Index page where I see the new Parent displayed.

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
