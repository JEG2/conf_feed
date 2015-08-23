require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  it "signs in a user" do
    user = FactoryGirl.create(:user)
    post :create, email: user.email, password: user.password
    assert_response(:redirect)
    expect(session[:user_id]).to eq(user.id)
  end

  it "returns invalid sign ins to the form with an error" do
    user = FactoryGirl.create(:user)
    post :create, email: user.email, password: ""
    assert_response(:success)
    expect(session[:user_id]).not_to eq(user.id)
    expect(flash[:alert]).not_to be_nil
  end
end
