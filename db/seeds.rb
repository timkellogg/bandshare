require 'bundler/setup'
Bundler.require :default, :test

require './lib/venue.rb'
require './lib/band.rb'

MUSIC_STYLES = %w[rock jazz hip-hop rnb blues alternative country island traditional folk rap electronic house]

25.times do |n|
	name = Faker::Lorem.word 
	country_from = Faker::Address.country 
	music_style = MUSIC_STYLES.sample
	bio = Faker::Lorem.paragraph
	Band.create(name: name, country_from: country_from, music_style: music_style, bio: bio)
end