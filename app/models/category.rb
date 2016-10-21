class Category < ActiveRecord::Base
  # Remember to create a migration!
  has_many :listings
  belongs_to :user

  validates :name, :user_id, presence: true
  validates :name, uniqueness: true
end
