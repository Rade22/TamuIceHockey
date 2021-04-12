# frozen_string_literal: true

class ApplicationController < ActionController::Base
    before_action :set_time_zone
    
    private

    def set_time_zone
      Time.zone = 'Central Time (US & Canada)'
    end
end
