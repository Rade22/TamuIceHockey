# frozen_string_literal: true

class Player < ApplicationRecord
	has_many :participation
	after_initialize :set_defaults, unless: :persisted?

	def set_defaults
  		self.image_link ||= '/assets/HockeyLogo.png'
	end
end

