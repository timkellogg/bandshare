require 'spec_helper'

describe Band do  

	it { should have_and_belong_to_many :venues }
	it { should validate_presence_of    :name   }
	it { should validate_uniqueness_of  :name   }  

	context 'when saving the band into the database' do 
	  it 'should capitalize multiple word band names' do 
	  	@band = Band.create(name: "the beatles", country_from: "England", music_style: "classic rock" )
	  	expect(@band.name).to eq 'The Beatles'
	  end

	  it 'should capitalize singular word band names' do  
	  	@band = Band.create(name: "blink", country_from: "America", music_style: "alternative" )
	  	expect(@band.name).to eq 'Blink'
	  end
	end
end