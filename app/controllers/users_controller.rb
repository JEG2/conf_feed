class UsersController < ApplicationController
  # new: form
  def new
    @user = User.new
  end

  # create:  does the creation
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to verify_path(user_id: @user.id)
    else
      render :new
    end
  end

  # index:  list all
  # show:  show one
  # edit: form
  # update:  does the update
  # destroy:  delete one

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
