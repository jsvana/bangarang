class Artist < ActiveRecord::Base
  has_many :albums
  has_many :tracks

  validates :name, uniqueness: true
end
