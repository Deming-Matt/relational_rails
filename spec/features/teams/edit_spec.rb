require 'rails_helper'
# As a visitor
# When I visit a parent show page
# Then I see a link to update the parent "Update Parent"
# When I click the link "Update Parent"
# Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/parents/:id',
# the parent's info is updated,
# and I am redirected to the Parent's Show page where I see the parent's updated info
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

require 'rails_helper'

# RSpec.describe 'New Artist' do
#   describe 'As a visitor' do
#     describe 'When I visit the artists index' do
#       it 'I can update an artist' do
#         beatles = Artist.create(name: 'Beatles')
#
#         visit '/artists'
#
#         click_link 'Edit'
#
#         expect(current_path).to eq("/artists/#{beatles.id}/edit")
#
#         fill_in 'Name', with: 'The Beatles'
#         click_on 'Update Artist'
#
#         expect(current_path).to eq("/artists")
#         expect(page).to have_content('The Beatles')
#       end
#     end
#   end
# end
