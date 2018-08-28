class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :jobs, dependent: :destroy
  has_many :contacts, dependent: :destroy

  def self.top_three_by_average_level_of_interest
    order(level_of_interest: :asc).group(sum(level_of_interest))
  end
end
