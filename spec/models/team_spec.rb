require 'rails_helper'

describe Team, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :roster_spots }
    it { should validate_presence_of :full_roster }
  end

  describe "relationships" do
    it { should have_many (:players)}
  end

end
