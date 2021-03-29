# spec/features/player_stats_spec.rb

require 'rails_helper'

RSpec.describe 'Create player stats', type: :feature do
	scenario 'valid inputs' do
		player = Player.create(first_name: 'Samuel', last_name: 'Adams', position: 'Goalie', number: 19)
		game = Game.create(against_team: 'Clemson', date: Time.now, location: 'Reed')

		visit new_participation_path
		select('Samuel Adams', from: 'participation_player_id')
		select('Clemson', from: 'participation_game_id')
		fill_in 'participation_goals', with: 2
		fill_in 'participation_assists', with: 3
		fill_in 'participation_powerplay_goals', with: 1
		fill_in 'participation_penalty_minutes', with: 1
		fill_in 'participation_time_on_ice', with: 30
		click_on 'Create Participation'
		visit participations_path
		expect(page).to have_content('Samuel')
	end
end