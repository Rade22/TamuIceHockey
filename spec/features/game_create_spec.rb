# frozen_string_literal: true

require 'rails_helper'
require 'helpers/login_helper'

Capybara.default_driver = :selenium

RSpec.describe 'Creating a game',
               type: :feature do
  before(:each) do
    @admin = Admin.create(email: 'test@tamu.edu')
    sign_in @admin
  end

  scenario 'no against team' do
    visit new_game_path
    fill_in 'game_against_team', with: ''
    fill_in 'game_date', with: '2021-04-22'
    fill_in 'game_time', with: '2:30 AM'
    fill_in 'game_ring_name', with: 'Reed'
    fill_in 'game_city', with: 'College Station'
    select('Texas', from: 'game_state')

    click_on 'Create Game'

    message = page.find('#game_against_team').native.attribute('validationMessage')
    expect(message).to eq 'Please fill out this field.'
  end

  scenario 'no date' do
    visit new_game_path
    fill_in 'game_against_team', with: 'Clemson'
    fill_in 'game_date', with: ''
    fill_in 'game_time', with: '2:30 AM'
    fill_in 'game_ring_name', with: 'Reed'
    fill_in 'game_city', with: 'College Station'
    select('Texas', from: 'game_state')

    click_on 'Create Game'

    message = page.find('#game_date').native.attribute('validationMessage')
    expect(message).to eq 'Please fill out this field.'

    visit games_path
    expect(page).not_to have_content('Clemson')
  end

  scenario 'valid inputs' do
    visit new_game_path
    fill_in 'game_against_team', with: 'Clemson'
    fill_in 'game_date', with: '2021-04-22'
    fill_in 'game_time', with: '23:59:00'
    fill_in 'game_ring_name', with: 'Reed'
    fill_in 'game_city', with: 'College Station'
    select('Texas', from: 'game_state')

    click_on 'Create Game'

    visit games_path
    expect(page).to have_content('Clemson')
  end
end
