class StaticPagesController < ApplicationController
  def home
    if current_user
      @results = current_user.results
    end
  end
end
