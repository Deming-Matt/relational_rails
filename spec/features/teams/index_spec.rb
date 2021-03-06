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

  #User story 6
  it 'can show the records in the teams database are ordered by most recently created first' do
    derw = Team.create!(name: "Detriot Red Wings", roster_spots: 22, full_roster: false, created_at: 5.second.ago)
    coav = Team.create!(name: "Colorado Avalanche", roster_spots: 23, full_roster: true, created_at: 1.second.ago)
    miwi = Team.create!(name: "Minnesota Wild", roster_spots: 23, full_roster: true, created_at: 10.second.ago)
    stlb = Team.create!(name: "St. Louis Blues", roster_spots: 21, full_roster: false, created_at: 4.second.ago)

    visit '/teams'

    expect(page.text.index("#{coav.name}")).to be < page.text.index("#{stlb.name}")
    expect(page.text.index("#{stlb.name}")).to be < page.text.index("#{derw.name}")
    expect(page.text.index("#{derw.name}")).to be < page.text.index("#{miwi.name}")
    expect(page).to have_content("#{coav.created_at}")
    expect(page).to have_content("#{derw.created_at}")
    expect(page).to have_content("#{stlb.created_at}")
  end

  #User story 7
  it 'can show the count of the number of players associated with that team' do
    coav = Team.create!(name: "Colorado Avalanche", roster_spots: 23, full_roster: true)
    coav.players.create!(fname: "Nathan", lname: "MacKinnon", jersey: 29, healthy: true)
    coav.players.create!(fname: "Gabriel", lname: "Landeskog", jersey: 92, healthy: true)
    coav.players.create!(fname: "Darcy", lname: "Kuemper", jersey: 35, healthy: false)
    coav.players.create!(fname: "Jack", lname: "Johnson", jersey: 3, healthy: true)

    visit "/teams/#{coav.id}"

    expect(page.text).to have_content("Players on roster: #{coav.players.count}")
  end

  #User story 9
  it 'can click a Teams link and route to Teams index page' do
    derw = Team.create!(name: "Detriot Red Wings", roster_spots: 22, full_roster: false, created_at: 5.second.ago)
    coav = Team.create!(name: "Colorado Avalanche", roster_spots: 23, full_roster: true, created_at: 1.second.ago)
    miwi = Team.create!(name: "Minnesota Wild", roster_spots: 23, full_roster: true, created_at: 10.second.ago)
    stlb = Team.create!(name: "St. Louis Blues", roster_spots: 21, full_roster: false, created_at: 4.second.ago)

    visit '/players'
    click_link "Teams"

    expect(page).to have_current_path('/teams')
  end

  #User story 17
  it 'has a link next to each team to edit that team' do
    derw = Team.create!(name: "Detriot Red Wings", roster_spots: 22, full_roster: false)

    visit "/teams"
    click_on "Edit"

    expect(current_path).to eq("/teams/#{derw.id}/edit")
  end

  #user story 22
  it 'has a delete link next to each team on the index page' do
    derw = Team.create!(name: "Detriot Red Wings", roster_spots: 22, full_roster: false, created_at: 5.second.ago)

    visit "/teams"
    click_on "Delete"
    expect(current_path).to eq("/teams")
    expect(page).to_not have_content("Detriot Redwings")
  end
end
