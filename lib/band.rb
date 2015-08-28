class Band < ActiveRecord::Base 
	has_and_belongs_to_many :venues, join_table: 'concerts'


	# Implement a validation
	# Add a callback

	# As a user, I do not want bands and venues to be saved if I enter a blank name.
	# 	As a user, I want band names and venues to be saved with a capital letter no matter how I enter them.
end