class Player < ApplicationRecord
  belongs_to :team

  validates_presence_of :fname
  validates_presence_of :lname
  validates_presence_of :jersey
  validates_inclusion_of :healthy, :in => [true, false]
end
