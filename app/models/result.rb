class Result < ApplicationRecord
  belongs_to :race
  belongs_to :user

  validates_presence_of :user_id, :race_id, :running_time
  validates :running_time, numericality: { other_than: 0 }
end
