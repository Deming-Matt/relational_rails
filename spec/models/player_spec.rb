require 'rails_helper'

describe Player, type: :model do
  describe "relationships" do
    it { should belong_to :team }
  end

  describe 'validations' do
    it { should validate_presence_of :fname }
    it { should validate_presence_of :lname }
    it { should validate_presence_of :jersey }
    it { should allow_value(true).for(:healthy)}
    it { should allow_value(false).for(:healthy)}
  end

  describe "healthy" do
    it "will show only players that are healthy" do
      coav = Team.create!(name: "Colorado Avalanche", roster_spots: 23, full_roster: true)
      nathan = coav.players.create!(fname: "Nathan", lname: "MacKinnon", jersey: 29, healthy: true)
      gabriel = coav.players.create!(fname: "Gabriel", lname: "Landeskog", jersey: 92, healthy: true)
      darcy = coav.players.create!(fname: "Darcy", lname: "Kuemper", jersey: 35, healthy: false)
      jack = coav.players.create!(fname: "Jack", lname: "Johnson", jersey: 3, healthy: true)

      expect(Player.is_healthy).to eq([nathan, gabriel, jack])
    end
  end

end
