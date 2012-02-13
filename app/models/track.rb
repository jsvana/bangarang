class Track < ActiveRecord::Base
  has_one :artist
  has_one :album
end
