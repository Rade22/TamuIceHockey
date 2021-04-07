# frozen_string_literal: true

class Game < ApplicationRecord
    extend SimpleCalendar
    
    def start_time
        self.date
    end
    
    validates :state, presence: true, length: {maximum: 2}

    has_many :participation
end

