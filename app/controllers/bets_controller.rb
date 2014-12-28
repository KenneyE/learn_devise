class BetsController < ApplicationController
  def create
    if @bet = current_user.bets.create(bet_params)
      flash[:notice] = ["Bet Successfully Created!"]
    else
      flash[:errors] = @bet.errors.full_messages
    end
    redirect_to current_user
  end

  def destroy
    bet =  Bet.find_by_id(params[:id])
    bet.delete
    redirect_to current_user
  end

  private
  def bet_params
    params.require(:bet).permit(:title, :premise, :amount)
  end
end
