require 'rails_helper'

RSpec.describe 'Deleting a game', type: :feature do
  scenario 'success' do
    game = Game.create(against_team: 'Clemson', date: '2021-03-20', time: '5:00 PM', ring_name: 'Wolf', city: 'Houston', state: 'TX')
    visit delete_game_path(id: game.id)
    click_on 'Delete Game'
    visit games_path
    expect(page).not_to have_content('Clemson')
  end

end