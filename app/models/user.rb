class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  validates_presence_of :first_name, :last_name
  validates_uniqueness_of :email

  has_many :results
  has_many :races, through: :results
end
