
require 'rails_helper'

RSpec.describe 'Updating a game', type: :feature do
	scenario 'valid inputs' do
		game = Game.create(against_team: 'Test', date: '2021-02-24 00:00:00 UTC', location: 'Texas');
		visit edit_game_path(id: game.id)
		fill_in 'player_against_team', with: 'Test Complete'
		click_on 'Update Game'
		visit games_path
		expect(page).to have_content('Test Complete')
	end
end