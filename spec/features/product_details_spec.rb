require 'rails_helper'

  RSpec.feature "ProductDetails", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "User can navigate from home page to product detail page by clicking on a product" do
    visit root_path

    save_screenshot
    have_link 'product.name', href: '/product/:id'
  end
end
