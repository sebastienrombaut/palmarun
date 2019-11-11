class Race < ApplicationRecord
  has_many :results
  has_many :users, through: :results

  validates_presence_of :name, :distance
  validates_uniqueness_of :name
end
