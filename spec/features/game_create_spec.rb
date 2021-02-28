require 'rails_helper'

RSpec.describe 'Creating a game', type: :feature do
	scenario 'valid inputs' do
		visit new_game_path
		fill_in 'game_against_team', with: 'Test3'
		fill_in 'game_date', with: '2021-02-24 22:00:00 UTC'
		fill_in 'game_location', with: 'unknow'
		click_on 'Create Game'
		visit games_path
		expect(page).to have_content('Test3')
	end
end
