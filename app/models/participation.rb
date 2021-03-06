# frozen_string_literal: true

class Participation < ApplicationRecord
  validates :player_id, presence: { message: 'You must select a player' }
  validates :game_id, presence: { message: 'You must select a game' }
  belongs_to :player
  belongs_to :game
end
