# frozen_string_literal: true

# game model
class Game < ApplicationRecord
  extend SimpleCalendar

  def start_time
    date
  end

  validates :state, presence: true, length: { maximum: 2 }

  has_many :participation
end
