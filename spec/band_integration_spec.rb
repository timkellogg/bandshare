require 'spec_helper'

describe 'when using the app as a band', { type: :feature } do  
	
	it 'allow you to view a listing of all bands' do  
		visit '/'
		click_link 'Check out our band listing'
		expect(page).to have_content 'Bands'
	end

	# Failing because of client-side form-validations
	# To make pass, you can disable client-side validations by removing data-abide from form
	# I think it's better to have user feedback
	it 'should allow you to make a new band, edit and delete' do  
		visit '/'
		click_link 'Band'
		expect(page).to have_content 'Register a New Band'
		fill_in 'band_name', with: 'The Beatles'
		fill_in 'country_from', with: 'England'
		select 'Rock', from: 'music_style'
		fill_in 'bio', with: 'The greatest band ever.'
		click_button 'Register Band!'
		expect(page).to have_content 'The Beatles rock The greatest band ever'
		click_button 'Edit'
		expect(page).to have_content 'Edit The Beatles'
		select 'Alternative', from: 'music_style'
		fill_in 'bio', with: 'The greatest band of all time.'
		click_button 'Submit Edit'
		expect(page).to have_content 'The greatest band of all time.'
		click_button 'Delete'
		expect(page).to have_content 'Bands'
	end



end