class UserBetsController < ApplicationController
  def create
    @user_bet = UserBet.new(user_id: current_user.id, bet_id: params[:id])
    if @user_bet.save
      flash[:notices] = ["Bet Accepted!"]
    else
      flash[:errors] = @user_bet.errors.full_messages
    end
    redirect_to current_user
  end

end
