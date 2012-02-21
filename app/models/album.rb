class Album < ActiveRecord::Base
  has_many :tracks
  belongs_to :artist

  default_scope includes(:tracks).order(:name)
end
