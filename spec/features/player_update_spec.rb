# spec/features/player_update_spec.rb

require 'rails_helper'

RSpec.describe 'Updating a player', type: :feature do
	scenario 'valid inputs' do
		player = Player.create(first_name: 'Sam', last_name: 'Hunt', position: 'Center', number: 69);
		visit edit_player_path(id: player.id)
		fill_in 'player_first_name', with: 'Tyler'
		click_on 'Update Player'
		visit players_path
		expect(page).to have_content('Tylee')
	end
end