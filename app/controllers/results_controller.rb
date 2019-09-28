class ResultsController < ApplicationController
  def index
    @results = current_user.results
  end

  def new
  end

  def show
  end

  def create
  end

  def destroy
  end
end
