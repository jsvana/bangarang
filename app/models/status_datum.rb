class StatusDatum < ActiveRecord::Base
	belongs_to :status
	default_scope order("created_at DESC").limit(10)
end
