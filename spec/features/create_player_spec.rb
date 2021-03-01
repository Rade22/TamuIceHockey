# spec/features/player_features_spec.rb

require 'rails_helper'

RSpec.describe 'Creating a player', type: :feature do
	scenario 'valid inputs' do
		visit new_player_path
		fill_in 'player_first_name', with: 'Matt'
		fill_in 'player_last_name', with: 'Bunker'
		select('Center', from: 'player_position')
		fill_in 'player_number', with: 20
		click_on 'Create Player'
		visit players_path
		expect(page).to have_content('Matt')
	end
end

		