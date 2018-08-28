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

  def self.count_by_level_of_interest
    order(level_of_interest: :desc).group(:level_of_interest).count
  end

  def self.count_by_location
    order(city: :desc).group(:city).count
  end

  def self.location_params(params)
    where(city: params[:location])
  end

end
