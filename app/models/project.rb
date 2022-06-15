class Project < ApplicationRecord
  before_save { email.downcase! }
  has_many :buildings
  has_many :units
  
  validates :name,         presence: true, length: { maximum: 25 },
                           uniqueness: true
  validates :address,      presence: true, length: { maximum: 255 },
                           uniqueness: true
  validates :email,        presence: true,
                           length: { maximum: 255 },
                           format: { with: VALID_EMAIL_REGEX }
  validates :no_buildings, numericality: { greater_than: 0 }
  validates :no_units,     numericality: { greater_than: :no_buildings }
end
