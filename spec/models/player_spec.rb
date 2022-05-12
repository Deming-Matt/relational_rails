require 'rails_helper'

describe Players, type: :model do
  describe "relationships" do
    it { should belong_to (:team)}
  end

  describe 'calidations' do
    it { should validate_presence_of :fname }
    it { should validate_presence_of :lname }
    it { should validate_presence_of :jersey }
    it { should validate_presence_of :healthy }
  end

end
