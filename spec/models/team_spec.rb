require 'rails_helper'

describe Team, type: :model do
  describe "relationships" do
    it { should have_many :players }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :roster_spots }
    it { should allow_value(true).for(:full_roster)}
    it { should allow_value(false).for(:full_roster)}
  end
#user story 6
  describe "ordered by most recently created" do
    it "shows the correct order of recently created" do
      derw = Team.create!(name: "Detriot Red Wings", roster_spots: 22, full_roster: false, created_at: 5.second.ago)
      coav = Team.create!(name: "Colorado Avalanche", roster_spots: 23, full_roster: true, created_at: 1.second.ago)
      miwi = Team.create!(name: "Minnesota Wild", roster_spots: 23, full_roster: true, created_at: 10.second.ago)
      stlb = Team.create!(name: "St. Louis Blues", roster_spots: 21, full_roster: false, created_at: 4.second.ago)

      expect(Team.recently_created).to eq([coav, stlb, derw, miwi])
    end
  end
end
