require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    it "should register" do
      @user = User.new({
        first_name: 'Rose',
        last_name: 'Wan',
        email: 'rose@wan.com',
        password: 'password',
        password_confirmation: 'password'
      })
      expect(@user.valid?).to be true
    end

    it "password doesn't match" do
      @user = User.new({
        first_name: 'Rose',
        last_name: 'Wan',
        email: 'rose@wan.com',
        password: 'password',
        password_confirmation: 'p4ssw0rd'
      })
    end

    it "email empty" do
      @user = User.new({
        first_name: 'Rose',
        last_name: 'Wan',
        email: nil,
        password: 'password',
        password_confirmation: 'password'
      })
      expect(@user.valid?).to be false
    end

    it "password empty" do
      @user = User.new({
        first_name: 'Rose',
        last_name: 'Wan',
        email: 'rose@wan.com',
        password: nil,
        password_confirmation: nil
      })
      expect(@user.valid?).to be false
    end


    it "check email address of new user with another user email" do
      @user1 = User.create({
        first_name: 'Rose',
        last_name: 'Wan',
        email: 'rose@wan.com',
        password: 'password',
        password_confirmation: 'password'
      })
      @user2 = User.new({
        first_name: 'Rose',
        last_name: 'Wan',
        email: 'rose@wan.com',
        password: 'password',
        password_confirmation: 'password'
      })
      @user2.save
      expect(@user2.valid?).to be false
    end

    it "password needs to be longer than 6 characters" do
      @user1 = User.create({
        first_name: 'Rose',
        last_name: 'Wan',
        email: 'rose@wan.com',
        password: 'password',
        password_confirmation: 'password'
      })
      expect(@user1.password.length).to be > 6
    end


  end

end
