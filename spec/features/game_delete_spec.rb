# frozen_string_literal: true

require 'rails_helper'
Capybara.default_driver = :selenium

RSpec.describe 'Deleting a game', type: :feature do
  before(:each) do
    @admin = Admin.create(email: 'test@tamu.edu')
    sign_in @admin
  end

  scenario 'success' do
    game = Game.create(against_team: 'Clemson', date: '2021-04-20', time: '5:00 PM', ring_name: 'Wolf',
                       city: 'Houston', state: 'TX')
    visit delete_game_path(id: game.id)

    accept_confirm do
      click_on 'Delete Game'
    end

    visit games_path
    expect(page).not_to have_content('Clemson')
  end
end
