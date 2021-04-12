# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Participation, type: :feature do
  before(:all) do
    @player = Player.create(first_name: 'Rylan', last_name: 'Wade', position: 'Center', number: 10)
    @game = Game.create(against_team: 'Test', date: '2021-02-24 00:00:00 UTC', state: 'TX')
  end

  it 'checks that a participation can be created' do
    @participation = Participation.create(player_id: @player.id, game_id: @game.id)
    expect(@participation).to be_valid
  end

  it 'checks that a participation cannot be created without player_id' do
    @participation = Participation.create(game_id: @game.id)
    expect(@participation).to_not be_valid
  end

  it 'checks that a participation cannot be created without game_id' do
    @participation = Participation.create(player_id: @player.id)
    expect(@participation).to_not be_valid
  end

  it 'checks that a participation can be updated' do
    @participation = Participation.create(player_id: @player.id, game_id: @game.id)
    @participation.update(assists_skater: 1)
    expect(Participation.find_by(assists_skater: 1)).to eq(@participation)
  end

  it 'checks that a participation can be destroyed' do
    @participation = Participation.create(player_id: @player.id, game_id: @game.id, assists_skater: 2)
    @participation.destroy
    expect(Participation.find_by(assists_skater: 2)).to be_nil
  end

  it 'checks that a participation cannot be created without corresponding player/game objects' do
    @game.destroy
    @player.destroy
    @participation = Participation.create(player_id: 1, game_id: 1)
    expect(@participation).to_not be_valid
  end
end
