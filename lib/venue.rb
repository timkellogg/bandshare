class Venue < ActiveRecord::Base 
	has_and_belongs_to_many :bands, join_table: 'concerts'
end