class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @bet = Bet.new
    @user  = current_user
  end
end
