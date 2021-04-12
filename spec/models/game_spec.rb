# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Game, type: :feature do

  it 'checks that a game can be created' do
    @game = Game.create(state: 'TX')
    expect(@game).to be_valid
  end

  it 'checks that a game cannot be created with a 3+ length abriviation' do
    @game = Game.create(state: 'TTX')
    expect(@game).to_not be_valid
  end

  it 'checks that a game can be updated' do
    @game = Game.create(state: 'TX')
    @game.update(against_team: 'Alpha')
    expect(Game.find_by(against_team: 'Alpha')).to eq(@game)
  end

  it 'checks that a game can be destroyed' do
    @game = Game.create(state: 'TX', against_team: 'Alpha')
    @game.destroy
    expect(Game.find_by(against_team: 'Alpha')).to be_nil
  end
end
