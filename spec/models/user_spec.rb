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
      @user.save
      expect(@user.valid?).to be true
    end

    it "has to have matching password with confirmation" do
      @user = User.new({
        first_name: 'Rose',
        last_name: 'Wan',
        email: 'rose@wan.com',
        password: 'password',
        password_confirmation: 'p4ssw0rd'
      })
      @user.save
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "email must be present" do
      @user = User.new({
        first_name: 'Rose',
        last_name: 'Wan',
        email: nil,
        password: 'password',
        password_confirmation: 'password'
      })
      @user.save
      expect(@user.errors.full_messages).to include ("Email can't be blank")
    end

    it "password empty" do
      @user = User.new({
        first_name: 'Rose',
        last_name: 'Wan',
        email: 'rose@wan.com',
        password: nil,
        password_confirmation: nil
      })
      @user.save
      expect(@user.errors.full_messages).to include ("Password can't be blank")
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
      expect(@user2.errors.full_messages).to include ("Email has already been taken")
    end

    it "email must not be case sensitive" do
      @user = User.new({
        first_name: 'RoSe',
        last_name: 'WaN',
        email: 'RoSE@WAN.com',
        password: 'password',
        password_confirmation: 'password'
      })
      @user.save
      expect(@user.errors.full_messages).to include()
    end

    it "password needs to be longer than 6 characters" do
      @user = User.new({
        first_name: 'Rose',
        last_name: 'Wan',
        email: 'rose@wan.com',
        password: 'password',
        password_confirmation: 'password'
      })
      @user.save
      expect(@user.password.length).to be > 6
    end
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
    it 'authentication is true' do
      @user = User.create({
        first_name: 'Rose',
        last_name: 'Wan',
        email: 'rose@wan.com',
        password: 'password',
        password_confirmation: 'password'
      })
      user_auth = User.authenticate_with_credentials(@user.email, @user.password)
      expect(user_auth).to eql @user
    end
    it "Login with white-space" do
      @user = User.create({
        first_name: 'Rose',
        last_name: 'Wan',
        email: '  rose@wan.com  ',
        password: 'password',
        password_confirmation: 'password'
      })
      user_auth = User.authenticate_with_credentials(@user.email, @user.password)
      expect(user_auth).to eql nil
    end
    it "Login with mix-case" do
      @user = User.create({
        first_name: 'Rose',
        last_name: 'Wan',
        email: 'RoSe@WaN.com',
        password: 'password',
        password_confirmation: 'password'
      })
      @user.save
      user_auth = User.authenticate_with_credentials(@user.email.strip.downcase, @user.password)
      expect(user_auth).to eql nil
    end
  end
end
