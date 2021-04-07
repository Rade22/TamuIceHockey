# frozen_string_literal: true

# spec/features/player_stats_spec.rb

require 'rails_helper'

RSpec.describe 'Create player stats', type: :feature do
  @player = Player.create(first_name: 'Samuel', last_name: 'Adams', position: 'Goalie', number: 19)
  @game = Game.create(against_team: 'Clemson', date: Time.now)

  let(:player_id) { @player.id }
  let(:game_id) { @game_id }

  scenario 'valid inputs' do
    visit new_participation_path
    fill_in 'participation_time_on_ice_goalie', with: 30
    click_on 'Create Participation'

    visit participations_path
    expect(page).to have_content('Samuel')
  end
end
