require 'spec_helper'

describe 'when making a concert', { type: :feature } do  
	
	it 'allow you to view a listing of all concerts' do  
		visit '/'
		click_link 'Check out upcoming concerts'
		expect(page).to have_content 'Concert'
	end

	# Failing because of client-side form-validations
	# To make pass, you can disable client-side validations by removing data-abide from form
	# I think it's better to have user feedback
	it 'should allow you to make a concert' do  
	  @band = Band.create(name: "the beatles", country_from: "England", music_style: "classic rock", bio: 'The greatest band ever.' )
		@venue = Venue.create(name: "holocene", city: "Portland", capacity: 326, pic_link: "http://www.holocene.org/photos/wedding_toast_large.jpg", country: "America")		  
		visit '/'
		click_link 'Concert'
		expect(page).to have_content 'Book a New Concert'
		select 'The Beatles', from: 'band'
		select 'Holocene', from: 'venue'
		fill_in 'attendance', with: 5
		click_button 'Book Concert!'
		expect(page).to have_content 'Holocene'
		visit "/bands/#{@band.id}"
		expect(page).to have_content 'Holocene'
		visit "/veneus/#{@venue.id}"
		expect(page).to have_content 'The Beatles'
	end
end

