require 'bundler/setup'
Bundler.require :default, :test

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

after { ActiveRecord::Base.connection.close }

# Bands

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
# # Create (bands)
# post '/bands' do 
# 	# get params 

# 	# create object 

# 	if @band.save 
# 		erb :band 
# 	else 
# 		redirect '/bands/new'
# 	end
# end

# # Edit (bands)
# get '/bands/:id/edit' do  
# 	@band = Band.find(params['id'])
# 	erb :edit_band_form 
# end


# # Update (bands)
# patch '/bands/:id' do  
# 	@band = Band.find(params['id'])

# 	# Fetch params 

# 	if @band.update({})
# 		erb: band 
# 	else 
# 		redirect "/bands/#{band.id}/edit"
# 	end
# end

# # Delete (bands)
# get '/bands/:id/delete' do  
# 	band = Band.find(params['id'])

# 	if band.delete 
# 		erb :bands 
# 	else 
# 		redirect "/bands/#{band.id}" 
# 	end
# end

# # Venues 

# # Index (venues)
# get '/venues' do  
# 	@venues = Venue.all  
# 	erb :venues 
# end

# # Show (venues)
# get '/venues/:id' do  
# 	@venue = Venue.find(params['id'])
# 	erb :venue 
# end

# # New (venues)
# get '/venues/new' do  
# 	erb :create_venue_form 
# end

# # Create (venues)
# post '/venues' do  
# 	# fetch params 

# 	# create venue 

# 	if @venue.save 
# 		erb :venues 
# 	else 
# 		redirect "/venues/new"
# 	end
# end

# # Edit (venues)
# get '/venues/:id/edit' do  
# 	erb :edit_venue_form 
# end

# # Update (venues)
# patch '/bands/:id' do  
# 	@venue = Venue.find(params['id'])

# 	# Fetch params 

# 	if @venue.update({})
# 		erb: venue 
# 	else 
# 		redirect "/venues/#{venue.id}/edit"
# 	end
# end

# # Delete (venues)
# get '/venues/:id/delete' do  
# 	venue = Venue.find(params['id'])

# 	if venue.delete 
# 		erb :venues 
# 	else 
# 		redirect "/venues/#{venue.id}" 
# 	end
# end






