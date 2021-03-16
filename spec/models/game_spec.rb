require 'rails_helper'

RSpec.describe Game, type: :feature do
	
	before(:all) do
		@game = Game.create(against_team: 'Test', date: '2021-02-24 00:00:00 UTC', ring_name: 'Texas', score: 1, opposing_score: 2) 
	end

	it 'checks that a game can be created' do
		expect(@game).to be_valid
	end

	it 'checks that a game can be updated' do
		@game.update(:against_team => "Alpha")
		expect(Game.find_by(against_team: "Alpha")).to eq(@game)
	end

	it 'checks that a game can be destroyed' do
		@game.destroy
		expect(Game.find_by(against_team: "Alpha")).to be_nil
	end
end
