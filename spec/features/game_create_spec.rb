require 'rails_helper'
require 'helpers/login_helper'

RSpec.describe 'Creating a game', type: :feature do
	
		before do
			@admin = Admin.create(email: 'test@gmail.com')
			sign_in @admin
		end
			
		scenario 'valid inputs' do
		
		visit new_game_path
		#Rails.logger.debug URI.parse(current_url).inspect
		fill_in 'game_against_team', with: 'Test3'
		fill_in 'game_date', with: '2021-03-22'
		fill_in 'game_time', with: '2:30 AM'
		fill_in 'game_ring_name', with: 'Reed'
		fill_in 'game_city', with: 'College Station'
		fill_in 'game_state', with: 'TX'
		click_on 'Create Game'
		visit games_path
		expect(page).to have_content('Test3')
	end
end
