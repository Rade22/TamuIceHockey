# frozen_string_literal: true

# spec/features/player_update_spec.rb

require 'rails_helper'
Capybara.default_driver = :selenium

RSpec.describe 'Edit player', type: :feature do
  before(:each) do
    @admin = Admin.create(email: 'test@tamu.edu')
    sign_in @admin
  end

  scenario 'valid inputs' do
    player = Player.create(first_name: 'Sam', last_name: 'Hunt', position: 'Center', number: 69,
                           image_link: '/assets/HockeyLogo.png')
    visit edit_player_path(id: player.id)
    fill_in 'player_first_name', with: 'Tyler'
    click_on 'Update Player'
    visit players_path
    expect(page).to have_content('Tyler')
  end

  scenario 'remove name' do
    player = Player.create(first_name: 'Sam', last_name: 'Hunt', position: 'Center', number: 69,
                           image_link: '/assets/HockeyLogo.png')
    visit edit_player_path(id: player.id)
    fill_in 'player_first_name', with: ''
    fill_in 'player_last_name', with: ''
    click_on 'Update Player'

    message = page.find('#player_first_name').native.attribute('validationMessage')
    expect(message).to eq 'Please fill out this field.'

    message2 = page.find('#player_last_name').native.attribute('validationMessage')
    expect(message2).to eq 'Please fill out this field.'

    visit players_path
    expect(page).to have_content('Sam')
  end

  scenario 'remove number' do
    player = Player.create(first_name: 'Sam', last_name: 'Hunt', position: 'Center', number: 69,
                           image_link: '/assets/HockeyLogo.png')
    visit edit_player_path(id: player.id)
    fill_in 'player_number', with: ''
    click_on 'Update Player'

    message = page.find('#player_number').native.attribute('validationMessage')
    expect(message).to eq 'Please enter a number.'

    visit players_path
    expect(page).to have_content('Sam')
  end
end
