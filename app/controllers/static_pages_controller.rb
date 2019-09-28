class StaticPagesController < ApplicationController
  def home
    if current_user
      @results = current_user.results.joins(:race).order("races.date DESC")
    end
  end
end
