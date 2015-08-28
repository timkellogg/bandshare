class Band < ActiveRecord::Base 
	has_many :concerts
	has_many :venues, through: :concerts
	validates :name, presence: true, uniqueness: true 
	validates :country_from, presence: true 
	validates :music_style, presence: true 
	validates :bio, presence: true, length: { maximum: 1000 } 
	before_save :capitalize_name

	private 
		def capitalize_name
	  	self.name = self.name.split.collect(&:capitalize).join(' ') 
		end
end



