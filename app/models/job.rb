class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments

  def self.sort_level_interest
    order('level_of_interest DESC')
  end

  def self.city_sort
    order('city ASC')
  end

end
