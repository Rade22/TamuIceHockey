# frozen_string_literal: true

# spec/features/player_features_spec.rb

require 'rails_helper'
Capybara.default_driver = :selenium

RSpec.describe 'Creating a player',
               type: :feature do
  before(:each) do
    @admin = Admin.create(email: 'test@tamu.edu')
    sign_in @admin
  end

  scenario 'valid inputs' do
    visit new_player_path
    fill_in 'player_first_name', with: 'Matt'
    fill_in 'player_last_name', with: 'Bunker'
    select('Center', from: 'player_position')
    fill_in 'player_number', with: 20
    fill_in 'player_image_link', with: '/assets/HockeyLogo.png'
    click_on 'Create Player'
    visit players_path
    expect(page).to have_content('Matt')
  end

  scenario 'no name' do
    visit new_player_path
    fill_in 'player_first_name', with: ''
    fill_in 'player_last_name', with: ''
    select('Center', from: 'player_position')
    fill_in 'player_number', with: 20
    click_on 'Create Player'

    message = page.find('#player_first_name').native.attribute('validationMessage')
    expect(message).to eq 'Please fill out this field.'

    message2 = page.find('#player_last_name').native.attribute('validationMessage')
    expect(message2).to eq 'Please fill out this field.'

    visit players_path
    expect(page).not_to have_content('Matt')
  end

  scenario 'no player number' do
    visit new_player_path
    fill_in 'player_first_name', with: 'Matt'
    fill_in 'player_last_name', with: 'Bunker'
    select('Center', from: 'player_position')
    fill_in 'player_number', with: ''
    click_on 'Create Player'

    message = page.find('#player_number').native.attribute('validationMessage')
    expect(message).to eq 'Please enter a number.'

    visit players_path
    expect(page).not_to have_content('20')
  end
end
