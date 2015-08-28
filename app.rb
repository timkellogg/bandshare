require 'bundler/setup'
Bundler.require :default, :test

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

after { ActiveRecord::Base.connection.close }

############ Bands ###############

# Landing page
get '/' do 
	erb :index
end

# # Index (bands)
get '/bands' do 
	@bands = Band.all.order(:name) 
	erb :bands 
end

# New (bands)
get '/bands/new' do  
	erb :create_band_form 
end

# Show (bands)
get '/bands/:id' do  
	@band = Band.find(params['id'])
	erb :band
end

# Create (bands)
post '/bands' do 
	band_name = params['band_name'] 
	country_from = params['country_from']
	music_style = params['music_style']
	bio = params['bio']

	@band = Band.new(name: band_name, country_from: country_from, music_style: music_style, bio: bio)
	if @band.save 
		erb :band 
	else 
		redirect '/bands/new'
	end
end

# Edit (bands)
get '/bands/:id/edit' do  
	@band = Band.find(params['id'])
	erb :edit_band_form 
end


# Update (bands)
patch '/bands/:id' do  
	@band = Band.find(params['id'])

	band_name = params['band_name'] 
	country_from = params['country_from']
	music_style = params['music_style']
	bio = params['bio']
	
	if @band.update(name: band_name, country_from: country_from, music_style: music_style, bio: bio)
		erb :band 
	else 
		redirect "/bands/#{band.id}/edit"
	end
end

# Delete (bands)
get '/bands/:id/delete' do  
	band = Band.find(params['id'])

	if band.delete 
		redirect "/bands" 
	else 
		redirect "/bands/#{band.id}" 
	end
end

########### Venues ##############

# Index (venues)
get '/venues' do  
	@venues = Venue.all.order(:capacity)  
	erb :venues 
end

# New (venues)
get '/venues/new' do  
	erb :create_venue_form 
end

# Show (venues)
get '/venues/:id' do  
	@venue = Venue.find(params['id'])
	erb :venue 
end

# Create (venues)
post '/venues' do  
	name = params['name']
	city = params['city']
	capacity = params['capacity']
	pic_link = params['pic_link']
	country = params['country']

	@venue = Venue.new(name: name, city: city, country: country, capacity: capacity, pic_link: pic_link)
	if @venue.save 
		erb :venue 
	else 
		redirect "/venues/new"
	end
end

# Edit (venues)
get '/venues/:id/edit' do
	@venue = Venue.find(params['id'])  
	erb :edit_venue_form 
end

# Update (venues)
patch '/venues/:id' do  
	@venue = Venue.find(params['id'])

	name = params['name']
	city = params['city']
	capacity = params['capacity'].to_i
	pic_link = params['pic_link']
	country = params['country']

	if @venue.update(name: name, city: city, capacity: capacity, pic_link: pic_link, country: country)
		erb :venue 
	else 
		redirect "/venues/#{venue.id}/edit"
	end
end

# Delete (venues)
get '/venues/:id/delete' do  
	@venue = Venue.find(params['id'])

	if @venue.delete 
		redirect "/venues" 
	else 
		redirect "/venues/#{@venue.id}" 
	end
end




