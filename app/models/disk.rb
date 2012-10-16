class Disk < ActiveRecord::Base
  attr_accessible :name, :size, :space_used, :space_available
  attr_accessible :percent_used, :mount_point

  belongs_to :server
end
