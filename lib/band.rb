class Band < ActiveRecord::Base 
	has_and_belongs_to_many :venues, join_table: 'concerts'
	validates :name, presence: true 
	before_save :capitalize_name

	private 
		def capitalize_name
	  	self.name = self.name.split.collect(&:capitalize).join(' ') 
		end
end

