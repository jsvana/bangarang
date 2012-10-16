class StatusDatum < ActiveRecord::Base
	belongs_to :status
	default_scope order("created_at ASC").limit(10)
end
