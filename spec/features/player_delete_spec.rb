# spec/features/player_delete_spec.rb

require 'rails_helper'

RSpec.describe 'Deleting a player', type: :feature do
  scenario 'success' do
    Player.create(first_name: 'Terry', last_name: 'Crews', position: 'Goalie', number: 25)
    visit players_path
    expect(page).to have_content('Terry')
    click_on 'Delete Player Profile'
    click_on 'Delete Player'
    expect(page).not_to have_content('Terry')
  end
end