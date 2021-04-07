# frozen_string_literal: true

# spec/features/player_delete_spec.rb

require 'rails_helper'

RSpec.describe 'Deleting a player', type: :feature do
  scenario 'success' do
    player = Player.create(first_name: 'Terry', last_name: 'Crews', position: 'Goalie', number: 25,
                           image_link: '/assets/HockeyLogo.png')
    visit players_path
    expect(page).to have_content('Terry')
    visit delete_game_path(id: player.id)
    click_on 'Delete Player'
    visit players_path
    expect(page).not_to have_content('Terry')
  end
end
