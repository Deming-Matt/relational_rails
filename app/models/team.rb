class Team < ApplicationRecord
  has_many :players

  validates_presence_of :name
  validates_presence_of :roster_spots
  validates_presence_of :full_roster
end
