require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
  #   it { is_expected.to validate_presence_of(:name) }
  #   it { is_expected.to validate_presence_of(:price) }
  #   it { is_expected.to validate_presence_of(:quantity) }
  #   it { is_expected.to validate_presence_of(:category) }
  # end
    it 'should be a valid test' do
      @category = Category.new
      @product = Product.create({
        name: 'Wooden Bow',
        price: 25,
        quantity: 50,
        category: @category
      })
      expect(@product.valid?).to be true
    end

    it 'name is empty' do
      @category = Category.new
      @product = Product.create({
        name: nil,
        price: 15,
        quantity: 100,
        category: @category
      })
      @product.save
      expect(@product.errors.full_messages).to include "Name can't be blank"
    end

    it 'price is empty' do
      @category = Category.new
      @product = Product.create({
        name: "Soywax candle",
        price: nil,
        quantity: 15,
        category: @category
      })
      @product.save
      expect(@product.errors.full_messages).to include "Price can't be blank"
    end

    it 'quantity is empty' do
      @category = Category.new
      @product = Product.create({
        name: "S'well water bottles",
        price: 45,
        quantity: nil,
        category: @category
      })
      @product.save
      expect(@product.errors.full_messages).to include "Quantity can't be blank"
    end

    it 'category is empty' do
      @category = Category.new
      @product = Product.create({
        name: "night table",
        price: 45,
        quantity: 15,
        category_id: nil
      })
      @product.save
      expect(@product.errors.full_messages).to include "Category can't be blank"
    end

  end
end
