class StaticPagesController < ApplicationController
  def home
    if current_user
      @results = current_user.results_order_by_races_date
    end
  end
end
