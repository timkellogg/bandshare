require 'spec_helper'

describe 'when using the app as a venue', { type: :feature } do  
	
	it 'allow you to view a listing of all venues' do  
		visit '/'
		click_link 'Check out our concert venues'
		expect(page).to have_content 'Venues'
	end

	# Failing because of client-side form-validations
	# To make pass, you can disable client-side validations by removing data-abide from form
	# I think it's better to have user feedback
	it 'should allow you to make a new venue, edit and delete' do  
		visit '/'
		click_link 'Venue'
		expect(page).to have_content 'Register a New Venue'
		fill_in 'venue_name', with: 'Hollywood Bowl'
		fill_in 'country', with: 'America'
		fill_in 'city', with: 'Los Angeles.'
		fill_in 'pic_link', with: 'http://waterandpower.org/Historical_DWP_Photo_Collection_LA_Public_Library/Bowl_1937.jpg'
		fill_in 'capacity', with: 17376
		click_button 'Register Venue!'
		expect(page).to have_content 'Hollywood Bowl'
		click_button 'Edit'
		expect(page).to have_content 'Edit The Beatles'
		fill_in 'venue_name', with: 'Hollywood Plate'
		click_button 'Submit Edit'
		expect(page).to have_content 'Plate'
		click_button 'Delete'
		expect(page).to have_content 'Venues'
	end

end