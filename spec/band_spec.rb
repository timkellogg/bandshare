require 'spec_helper'

describe Band do  

	it { should have_many               :venues 					}
	it { should validate_presence_of    :name   		  		}
	it { should validate_uniqueness_of  :name   		  		}  
	it { should validate_presence_of    :country_from 		}
	it { should validate_presence_of    :music_style  		}
	it { should validate_presence_of    :bio          		}
	it { should validate_length_of(:bio).is_at_most(1000) }
	
	context 'when saving the band into the database' do 
	  it 'should capitalize multiple word band names' do 
	  	@band = Band.create(name: "the beatles", country_from: "England", music_style: "classic rock", bio: 'The greatest band ever.' )
	  	expect(@band.name).to eq 'The Beatles'
	  end

	  it 'should capitalize singular word band names' do  
	  	@band = Band.create(name: "blink", country_from: "America", music_style: "alternative", bio: 'Not the greatest, but pretty legit.' )
	  	expect(@band.name).to eq 'Blink'
	  end
	end
end

