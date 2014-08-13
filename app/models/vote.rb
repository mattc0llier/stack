class Vote < ActiveRecord::Base
	belongs_to :story, counter_cache: true
	validates :ip_address, uniqueness: { scope: :story }
end
