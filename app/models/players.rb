class Players < ApplicationRecord
  belongs_to :team

  validates_presence_of :fname
  validates_presence_of :lname
  validates_presence_of :jersey
  validates_presence_of :healthy
end
