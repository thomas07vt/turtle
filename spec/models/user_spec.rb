require 'rails_helper'

describe User do
  before :each do
    @user = FactoryGirl.build(:user)
  end

  context "when a user is valid" do

    it "should be valid with a firstname, lastname, email and password" do
      expect(@user).to be_valid
    end

    it "should not be valid without a first_name" do
      @user.first_name = nil
      expect(@user).not_to be_valid
    end

    it "should not be valid without a last_name" do
      @user.last_name = nil
      expect(@user).not_to be_valid
    end

    it "should not be valid without an email" do
      @user.email = nil
      expect(@user).not_to be_valid
    end

    it "should not be valid without an password" do
      @user.password = nil
      expect(@user).not_to be_valid
    end

    it "should not be valid when the email is in use" do
      expect(@user).to be_valid
      @user.confirm!
      @user.save!
      @user2 = FactoryGirl.build(:user)
      expect(@user2).not_to be_valid
    end

    it "should have a role of :user as default" do
      expect(@user.role) == "user"
    end

  end

  describe "#role?" do 

    it "should return true when passed :admin for an admin" do
      @user.role = "admin"
      @user.role?(:admin)
    end

    it "should return true when passed :user for a user" do
      @user.role?(:user)
    end

  end

end

