class RacesController < ApplicationController
  def new
    @race = Race.new
  end

  def create
    @race = Race.new(race_params)

    if @race.save
      flash[:success] = "La course a bien été créée !"
      redirect_to new_result_path
    else
      flash[:danger] = "Le course n'a pas été créée"
      redirect_to new_race_path
    end
  end

  private

  def race_params
    params.permit(
      :name,
      :distance,
      :height_difference,
    )
  end
end
