require 'rails_helper'

describe Player, type: :model do
  describe "relationships" do
    it { should belong_to :team }
  end

  describe 'calidations' do
    it { should validate_presence_of :fname }
    it { should validate_presence_of :lname }
    it { should validate_presence_of :jersey }
    it { should allow_value(true).for(:healthy)}
    it { should allow_value(false).for(:healthy)}
  end

end
