class Player < ApplicationRecord
  belongs_to :team

  validates_presence_of :fname
  validates_presence_of :lname
  validates_presence_of :jersey
  validates_inclusion_of :healthy, :in => [true, false]

  def self.is_healthy
    Player.where(healthy: true)
  end

  def self.alphabetize
    Player.order(:fname)
  end

  def self.jersey_higher_than(num)
    Player.order(:jersey).where("jersey > 30")
  end
end
