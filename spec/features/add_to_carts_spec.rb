# bin/rails generate rspec:feature add_to_cart

require 'rails_helper'

RSpec.feature "Visitor adds to their cart", type: :feature, js: true do

 # SETUP
 before :each do
   @category = Category.create! name: 'Apparel'

   1.times do |n|
     @category.products.create!(
       name:  Faker::Hipster.sentence(3),
       description: Faker::Hipster.paragraph(4),
       image: open_asset('apparel1.jpg'),
       quantity: 10,
       price: 64.99
     )
   end
 end
end
