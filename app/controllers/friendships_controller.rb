class FriendshipsController < ApplicationController  
  def create  
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])  
    if @friendship.save  
      flash[:notice] = "Vriend toegevoegd."  
      redirect_to current_user  
    else  
      flash[:error] = "Er ging iets mis!"  
      redirect_to root_url  
    end  
  end  
  
  def destroy  
    @friendship = current_user.friendships.find(params[:id])  
    @friendship.destroy  
    flash[:notice] = "Vriend verwijderd."  
    redirect_to current_user  
  end  
end  
