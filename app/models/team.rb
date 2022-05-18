class Team < ApplicationRecord
  has_many :players, dependent: :destroy

  validates_presence_of :name
  validates_presence_of :roster_spots
  validates_inclusion_of :full_roster, :in => [true, false]

  def self.recently_created
    Team.order(created_at: :desc)
  end
end
