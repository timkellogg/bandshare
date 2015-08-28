class Venue < ActiveRecord::Base 
	has_many :concerts 
	has_many :bands, through: :concerts 
	validates :name, presence: true, uniqueness: true 
	validates :city, presence: true 
	validates :pic_link, presence: true 
	validates :country, presence: true 
	validates :capacity, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 500000 }
	before_save :capitalize_name

	private 

		def capitalize_name
			self.name = self.name.split.collect(&:capitalize).join(' ')
		end
end
