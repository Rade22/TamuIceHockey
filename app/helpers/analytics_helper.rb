module AnalyticsHelper
    def trythis
        pie_chart ({"Powerplay goals" => @powerplay_goal, "Other goals" => @normal_goal})
      end
end
