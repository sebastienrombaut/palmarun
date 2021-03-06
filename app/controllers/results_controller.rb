class ResultsController < ApplicationController
  def index
    @results = current_user.search_results(params)
  end

  def new
    @result = Result.new
    @races_names = Race.all.map { |r| r.name }
  end

  def create
    @result = Result.new
    @result.running_time = convert_time_input_into_seconds_integer(params[:running_time])
    @result.race_id = Race.find_by(name: params[:race_name]).id
    @result.user_id = current_user.id
    @result.general_classification = params[:general_classification]
    @result.date = params[:date]

    if @result.save
      flash[:success] = "Le résultat a bien été créé !"
      redirect_to root_path
    else
      flash[:danger] = "Le résultat n'a pas été crée"
      redirect_to new_result_path
    end
  end

  def edit
    @result = Result.find(params[:id])
    @races_names = Race.all.map { |r| r.name }
  end

  def update
    @result = Result.find(params[:id])
    convert_running_time_from_user_input(result_params[:running_time])

    if @result.update(result_params)
      flash[:success] = "Le résultat a bien été édité !"
    else
      flash[:danger] = "Le résultat n'a pas été édité"
    end

    redirect_to root_path
  end

  def show
  end

  def destroy
    @result = Result.find(params[:id])

    if @result.destroy
      flash[:success] = "Le résultat a bien été supprimé !"
    else
      flash[:danger] = "Le résultat n'a pas été supprimé"
    end

    redirect_to root_path
  end

  private

  def result_params
    params.require(:result).permit(
      :race_id,
      :user_id,
      :general_classification,
      :running_time,
      :date,
    )
  end

  def convert_time_input_into_seconds_integer(string)
    string.split(':').map { |a| a.to_i }.inject(0) { |a, b| a * 60 + b}
  end

  def convert_running_time_from_user_input(string)
    params[:result][:running_time] = convert_time_input_into_seconds_integer(string)
  end
end
