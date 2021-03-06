# == Schema Information
#
# Table name: seasons
#
#  id            :integer          not null, primary key
#  campground_id :integer
#  name          :string           not null
#  start_date    :date             not null
#  end_date      :date             not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_seasons_on_campground_id  (campground_id)
#
# Foreign Keys
#
#  fk_rails_...  (campground_id => campgrounds.id)
#

class Season < ApplicationRecord

  # == Validations
  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_after_start

  # == Associations
  belongs_to :campground

  has_many :prices

  has_many :rental_categories, through: :prices

  # == Functions
  def end_after_start
    if end_date < start_date
      errors.add(:end_date, :before_start)
    end
  end

end
