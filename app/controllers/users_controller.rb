class UsersController < ApplicationController

  before_action :authenticate_user!

  @users = User.all
  def index
    @user = current_user
  end
end
