require 'rails_helper'

RSpec.describe 'Updating a game', type: :feature do
	scenario 'valid inputs' do
		game = Game.create(against_team: 'Test', date: '2021-02-24 00:00:00 UTC', location: 'Texas', score: 1, opposing_score: 2)
		visit edit_game_path(id: game.id)
		fill_in 'game_against_team', with: 'Test Complete'
		fill_in 'game_score', with: 10
		fill_in 'game_opposing_score', with: 10
		click_on 'Update Game'
		visit games_path
		expect(page).to have_content('Test Complete')
	end

	scenario 'invalid inputs' do
		game = Game.create(against_team: 'Test', date: '2021-02-24 00:00:00 UTC', location: 'Texas');
		visit edit_game_path(id: game.id)
		fill_in 'game_against_team', with: ''
		click_on 'Update Game'
		visit games_path
		expect(page).to have_content('')
	end
end