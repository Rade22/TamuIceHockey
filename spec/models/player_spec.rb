# frozen_string_literal: true

# spec/models/player_feature_spec.rb

require 'rails_helper'

RSpec.describe Player, type: :feature do
  it 'checks that a player can be created' do
    @player = Player.create(first_name: 'Rylan', last_name: 'Wade', position: 'Center', number: 10)
    expect(@player).to be_valid
  end

  it 'checks that a player without an image link has it set to the default properly' do
    @player = Player.create(first_name: 'Rylan', last_name: 'Wade', position: 'Center', number: 10)
    expect(@player.image_link).to eq('/assets/HockeyLogo.png')
  end

  it 'checks that a player can be updated' do
    @player = Player.create(first_name: 'Rylan', last_name: 'Wade', position: 'Center', number: 10)
    @player.update(first_name: 'Johnny')
    expect(Player.find_by(first_name: 'Johnny')).to eq(@player)
  end

  it 'checks that a player can be destroyed' do
    @player = Player.create(first_name: 'David', last_name: 'Wade', position: 'Center', number: 10)
    @player.destroy
    expect(Player.find_by(first_name: 'David')).to be_nil
  end
end
