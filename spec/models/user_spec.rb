require 'rails_helper'

RSpec.describe User, type: :model do
  it "ensures the email is present" do
    user = User.new(email: nil)
    expect(user).not_to                be_valid  # !user.valid?
    expect(user.errors[:email]).not_to be_empty
  end

  it "ensures the email is well-formed" do
    user = User.new(email: "not an email address")
    expect(user).not_to                be_valid
    expect(user.errors[:email]).not_to be_empty
  end

  it "ensures the email is unique" do
    user1 = FactoryGirl.create(:user)
    user2 = User.new(email: user1.email)
    expect(user2).not_to                be_valid
    expect(user2.errors[:email]).not_to be_empty
  end

  it "ensures password is present on creation" do
    user = User.new(password: nil)
    expect(user).not_to                be_valid
    expect(user.errors[:password]).not_to be_empty
  end

  it "ensures password confirmation is present on change" do
    user = User.new(password: "123", password_confirmation: "")
    expect(user).not_to                                be_valid
    expect(user.errors[:password_confirmation]).not_to be_empty
  end

  it "ensures password is confirmed on change" do
    user = User.new(password: "123", password_confirmation: "abc")
    expect(user).not_to                                be_valid
    expect(user.errors[:password_confirmation]).not_to be_empty
  end

  it "allows us to authenticate a user" do
    user = FactoryGirl.build(:user)
    expect(user.authenticate("123")).to be_truthy
    expect(user.authenticate("abc")).to be_falsey
  end
end
