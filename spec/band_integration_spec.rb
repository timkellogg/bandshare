require 'spec_helper'

describe 'when using the app as a band', { type: :feature } do  
	
	it 'allow you to view a listing of all bands' do  
		visit '/'
		click_link 'Check out our band listing'
		expect(page).to have_content 'Bands'
	end


	it 'should allow you to make a new band, edit and delete' do  
		visit '/'
		click_link 'Band'
		expect(page).to have_content 'Register a New Band'
		fill_in 'band_name', with: 'The Beatles'
		fill_in 'country_from', with: 'England'
		fill_in 'bio', with: 'The greatest band ever.'
		click_button 'Register Band!'
		expect(page).to have_content 'The Beatles rock The greatest band ever'
		click_link 'Edit'
		expect(page).to have_content 'Submit Edit'
		select 'Alternative', from: 'music_style'
		fill_in 'bio', with: 'The greatest band of all time.'
		click_button 'Submit Edit'
		expect(page).to have_content 'Edit'
		click_link 'Delete'
		expect(page).to have_content 'Bands'
	end



end