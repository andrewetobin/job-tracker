class DashboardController < ApplicationController

  def index
    @count_by_level_of_interest = Job.count_by_level_of_interest
    @count_by_location = Job.count_by_location
  end
end
