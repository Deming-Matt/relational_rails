require 'rails_helper'

RSpec.describe 'team index page', type: :feature do
  #User Story 1, Parent Index
  #For each parent table
  #As a visitor
  #When I visit '/parents'
  #Then I see the name of each parent record in the system
  it "can see the name of each team" do

    visit '/team'
require "pry"; binding.pry
    expect(page).to have_content("Club: #{team.name}")
  end
end
