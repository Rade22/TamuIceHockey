# spec/models/player_feature_spec.rb

require 'rails_helper'

RSpec.describe Player, type: :feature do
	
	before(:all) do
		@player = Player.create(first_name: "Rylan", last_name: "Wade", position: "Center", number: 10) 
	end

	it 'checks that a player can be created' do
		expect(@player).to be_valid
	end


	it 'checks that a player can be updated' do
		@player.update(:first_name => "Johnny")
		expect(Player.find_by(first_name: "Johnny")).to eq(@player)
	end

	it 'checks that a player can be destroyed' do
		@player.destroy
		expect(Player.find_by(first_name: "Johnny")).to be_nil
	end
end

