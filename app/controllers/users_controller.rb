class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    if params[:bet_search]
      @searched_bets = Bet.search(params[:bet_search]).order("created_at DESC")
    end
    @bet = Bet.new
    @recent_bets = Bet.get_recent(current_user.id, 20)
    @user  = current_user
  end
end
