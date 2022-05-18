class Player < ApplicationRecord
  belongs_to :team

  validates_presence_of :fname
  validates_presence_of :lname
  validates_presence_of :jersey
  validates_inclusion_of :healthy, :in => [true, false]

  def self.is_healthy
      Player.where(healthy: true)
  end
  
end
