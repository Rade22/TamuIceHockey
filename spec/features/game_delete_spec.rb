require 'rails_helper'

RSpec.describe 'Deleting a game', type: :feature do
  scenario 'success' do
    game = Game.create(against_team: 'Clemson', date: '2021-02-24 00:00:00 UTC', ring_name: 'Texas', score: 1, opposing_score: 2)
    visit games_path
    expect(page).to have_content('Clemson')
    visit delete_game_path(id: game.id)
    click_on 'Delete Game'
    visit games_path
    expect(page).not_to have_content('Clemson')
  end

end