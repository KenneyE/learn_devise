class BetsController < ApplicationController
  before_action :authenticate_user!

  def create
    @bet = current_user.bets.create(bet_params)
    @bet.creator = current_user
    if @bet.save!
      flash[:notices] = ["Bet Successfully Created!"]
    else
      flash[:errors] = @bet.errors.full_messages
    end
    redirect_to current_user
  end

  def destroy
    bet =  Bet.find_by_id(params[:id])
    if bet.creator == current_user
      bet.delete
    else
      user_bet = UserBet.find_by(user: current_user, bet: bet)
      user_bet.delete
    end
    redirect_to current_user
  end

  # def search
  #   @searched_bets = Bet.search(params[:bet_search]).order("created_at DESC")
  #   @user = current_user
  #   @bet = Bet.new
  #   render 'users/show'
  # end

  private
  def bet_params
    params.require(:bet).permit(:title, :premise, :amount, :creator)
  end
end
