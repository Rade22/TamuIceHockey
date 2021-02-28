require 'rails_helper'

RSpec.describe 'Deleting a game', type: :feature do
  scenario 'success' do
    Game.create(against_team: 'Test', date: '2021-02-24 00:00:00 UTC', location: 'Texas', score: 1, opposing_score: 2)
    visit games_path
    expect(page).to have_content('Test')
    click_on 'Delete Game'
    click_on 'Delete Game'
    expect(page).not_to have_content('Test')
  end

  scenario 'success' do
    game1 = Game.create(against_team: 'Test1', date: '2021-02-24 00:00:00 UTC', location: 'Texas', score: 1, opposing_score: 2)
    game2 = Game.create(against_team: 'Test2', date: '2021-02-24 00:00:00 UTC', location: 'Texas', score: 1, opposing_score: 2)
    visit games_path
    expect(page).to have_content('Test1')
    visit delete_game_path(id: game1.id)
    click_on 'Delete Game'
    expect(page).to have_content('Test1')
  end
end