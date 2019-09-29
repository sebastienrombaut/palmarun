class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  validates_presence_of :first_name, :last_name
  validates_uniqueness_of :email

  has_many :results
  has_many :races, through: :results

  def results_order_by_races_date
    self.results.joins(:race).order("races.date DESC")
  end

  def search_results(search_params)
    results = self.results

    results = results.joins(:race).where(["races.name LIKE ?", "%#{search_params[:name]}%"]) if search_params[:name].present?
    results = results.joins(:race).where(["distance = ?", "#{search_params[:distance]}"]) if search_params[:distance].present?
    results = results.joins(:race).where(["date_part('year', date) = ?", "#{search_params[:year]}"]) if search_params[:year].present?

    return results
  end
end
