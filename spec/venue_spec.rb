require 'spec_helper'

describe Venue do  
	it { should have_and_belong_to_many :bands  }
	it { should validate_presence_of    :name   }
	it { should validate_uniqueness_of  :name   }

	context 'when saving the venue into the database' do  
		it 'should capitalize multiple word venue names' do  
			@venue = Venue.create(name: "hollywood bowl", city: "Los Angeles", capacity: 17376, 
				    pic_link: "http://www.seeing-stars.com/Images/Slides/Bowl.JPG", country: "America")
			expect(@venue.name).to eq 'Hollywood Bowl'
		end
		
		it 'should capitalize singular word venue names' do  
			@venue = Venue.create(name: "holocene", city: "Portland", capacity: 326, 
				    pic_link: "http://www.holocene.org/photos/wedding_toast_large.jpg", country: "America")			
			expect(@venue.name).to eq 'Holocene'
		end
	end
end
