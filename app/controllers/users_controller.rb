class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    binding.pry
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:sign_up, keys: [:nickname, :sei, :mei, :kanasei, :kanamei, :birthday])
  end
end
