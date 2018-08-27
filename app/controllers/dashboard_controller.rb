class DashboardController < ApplicationController

  def index
    @count_by_level_of_interest = Job.count_by_level_of_interest
  end
end
