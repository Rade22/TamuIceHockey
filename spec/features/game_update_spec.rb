require 'rails_helper'

RSpec.describe 'Updating a game', type: :feature do
	scenario 'valid inputs' do
		game = Game.create(against_team: 'Test', date: '2021-02-24', time: '2:30 PM', ring_name: 'Texas', city: 'Austin', state: 'TX')
		visit edit_game_path(id: game.id)
		fill_in 'game_against_team', with: 'TU'
		fill_in 'game_goals_for', with: 5
		fill_in 'game_goals_against', with: 10
		check 'game_is_overtime'
		fill_in 'game_powerplay_attempts', with: 10
		fill_in 'game_killed_penalties', with: 1
		fill_in 'game_total_penalties', with: 2
		click_on 'Update Game'
		expect(page).to have_content('TU')
	end
end