class Review < ActiveRecord::Base

  validates :product_id, :user_id, :description, :rating, presence: true

  belongs_to :product, :user

end
