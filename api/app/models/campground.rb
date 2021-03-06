# == Schema Information
#
# Table name: campgrounds
#
#  id            :integer          not null, primary key
#  name          :string           not null
#  address       :string           not null
#  zip_code      :string           not null
#  city          :string           not null
#  country       :string           not null
#  longitude     :float            not null
#  latitude      :float            not null
#  logo_url      :string
#  website_url   :string
#  phone_number  :string
#  mobile_number :string
#  currency      :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Campground < ApplicationRecord

  # == Validations
  validates :name, presence: true
  validates :address, presence: true
  validates :zip_code, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :currency, presence: true

  # == Associations
  has_many :rights
  has_many :api_keys
  has_many :seasons
  has_many :bookings
  has_many :rental_categories
  has_many :clients

  has_many :users, through: :rights

  # == Geocode
  # TODO ENABLE IN PRODUCTION
  # geocoded_by :full_street_address
  # after_validation :geocode

  # == Functions
  def full_street_address
    [address, zip_code, city].compact.join(', ')
  end

end
