require 'rails_helper'

RSpec.describe 'team_players_index', type: :feature do
  #User story 5
  it 'can show each player that is associated with that team' do
    coav = Team.create!(name: "Colorado Avalanche", roster_spots: 23, full_roster: true)
    coav.players.create!(fname: "Nathan", lname: "MacKinnon", jersey: 29, healthy: true)
    coav.players.create!(fname: "Gabriel", lname: "Landeskog", jersey: 92, healthy: true)
    coav.players.create!(fname: "Darcy", lname: "Kuemper", jersey: 35, healthy: false)
    coav.players.create!(fname: "Jack", lname: "Johnson", jersey: 3, healthy: true)

    visit "/teams/#{coav.id}/players"

    expect(page).to have_content("Name: Nathan MacKinnon")
    expect(page).to have_content("Name: Gabriel Landeskog")
    expect(page).to have_content("Jersey: 35")
    expect(page).to have_content("Jersey: 92")
    expect(page).to have_content("Healthy: true")
    expect(page).to have_content("Healthy: false")
  end

  #user story 16
  it "can click link, it returns to index page with players alphabetized" do
    coav = Team.create!(name: "Colorado Avalanche", roster_spots: 23, full_roster: true)
    nathan = coav.players.create!(fname: "Nathan", lname: "MacKinnon", jersey: 29, healthy: true)
    gabriel = coav.players.create!(fname: "Gabriel", lname: "Landeskog", jersey: 92, healthy: true)
    darcy = coav.players.create!(fname: "Darcy", lname: "Kuemper", jersey: 35, healthy: false)
    jack = coav.players.create!(fname: "Jack", lname: "Johnson", jersey: 3, healthy: true)

    visit "/teams/#{coav.id}/players"

    click_link "Alphabetize"

    expect(current_path).to eq("/teams/#{coav.id}/players")
    expect(page.text.index("#{darcy.fname}")).to be < page.text.index("#{gabriel.fname}")
    expect(page.text.index("#{gabriel.fname}")).to be < page.text.index("#{jack.fname}")
    expect(page.text.index("#{jack.fname}")).to be < page.text.index("#{nathan.fname}")
  end

  #user story 18
  it 'shows an edit link next to each player' do
    coav = Team.create!(name: "Colorado Avalanche", roster_spots: 23, full_roster: true)
    nathan = coav.players.create!(fname: "Nathan", lname: "MacKinnon", jersey: 29, healthy: true)

    visit "/teams/#{coav.id}/players"
    click_link "Edit"

    expect(current_path).to eq("/players/#{nathan.id}/edit")
  end

  #user Story 21
  it 'shows a form that will bring back players over a certain threshold' do
    coav = Team.create!(name: "Colorado Avalanche", roster_spots: 23, full_roster: true)
    nathan = coav.players.create!(fname: "Nathan", lname: "MacKinnon", jersey: 29, healthy: true)
    gabriel = coav.players.create!(fname: "Gabriel", lname: "Landeskog", jersey: 92, healthy: true)
    darcy = coav.players.create!(fname: "Darcy", lname: "Kuemper", jersey: 35, healthy: false)
    jack = coav.players.create!(fname: "Jack", lname: "Johnson", jersey: 3, healthy: true)

    visit "/teams/#{coav.id}/players"
    fill_in "Number", with: "30"
    click_on "Submit"

    expect(current_path).to eq("/teams/#{coav.id}/players")
    expect(page).to have_content("Darcy Kuemper")
    expect(page).to have_content("Gabriel Landeskog")
    expect(page).to_not have_content("Nathan MacKinnon")
    expect(page).to_not have_content("Jack Johnson")
  end

  #user story 23
  it 'shows a delete link next to each player and can delete that player' do
    coav = Team.create!(name: "Colorado Avalanche", roster_spots: 23, full_roster: true)
    nathan = coav.players.create!(fname: "Nathan", lname: "MacKinnon", jersey: 29, healthy: true)

    visit "/teams/#{coav.id}/players"
    click_on "Delete"

    expect(current_path).to eq("/players")
  end

end
