# frozen_string_literal: true

require 'rails_helper'

Capybara.default_driver = :selenium

RSpec.describe 'Updating a game',
               type: :feature do
  before(:each) do
    @admin = Admin.create(email: 'test@tamu.edu')
    sign_in @admin
  end

  scenario 'valid inputs' do
    game = Game.create(against_team: 'Test1', date: '2021-04-24', time: '2:30 PM', ring_name: 'Texas', city: 'Austin',
                       state: 'TX')

    visit edit_game_path(id: game.id)
    fill_in 'game_against_team', with: 'Clemson'
    fill_in 'game_goals_for', with: 5
    fill_in 'game_goals_against', with: 10
    check 'game_is_overtime'
    fill_in 'game_powerplay_attemps', with: 10
    fill_in 'game_killed_penalties', with: 1
    fill_in 'game_total_penalties', with: 2
    click_on 'Update Game'
    expect(page).to have_content('Total Penalties: 2')
  end

  scenario 'remove opposing team' do
    game = Game.create(against_team: 'Test1', date: '2021-04-24', time: '2:30 PM', ring_name: 'Texas', city: 'Austin',
                       state: 'TX')

    visit edit_game_path(id: game.id)
    fill_in 'game_against_team', with: ''
    fill_in 'game_goals_for', with: 5
    fill_in 'game_goals_against', with: 10
    check 'game_is_overtime'
    fill_in 'game_powerplay_attemps', with: 10
    fill_in 'game_killed_penalties', with: 1
    fill_in 'game_total_penalties', with: 2
    click_on 'Update Game'

    message = page.find('#game_against_team').native.attribute('validationMessage')
    expect(message).to eq 'Please fill out this field.'

    expect(page).not_to have_content('Test1')
  end

  scenario 'varying inputs' do
    game = Game.create(against_team: 'Test1', date: '2021-04-24', time: '2:30 PM', ring_name: 'Texas', city: 'Austin',
                       state: 'TX')

    visit edit_game_path(id: game.id)
    fill_in 'game_against_team', with: 'Clemson'
    fill_in 'game_goals_for', with: 5
    check 'game_is_overtime'
    check 'game_scrimmage'
    fill_in 'game_total_penalties', with: 2
    click_on 'Update Game'
    expect(page).to have_content('Overtime')
    expect(page).to have_content('Scrimmage')
    expect(page).to have_content('Total Penalties: 2')
  end
end
