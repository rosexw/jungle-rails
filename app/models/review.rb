class Review < ActiveRecord::Base

  validates :product_id, :user_id, :description, presence: true
  validates :rating, presence: true, numericality: true, inclusion: { in: 0..5 }

  belongs_to :product
  belongs_to :user

end
