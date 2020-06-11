class RelationshipsController < ApplicationController
  def create
    @user = User.find(params[:followed_id])
    @current_user.follow(@user)
    respond_to do |format|
      format.html { redirect_to "/users/#{@user.id}/show" }
      format.js 
      format.json { render json: @user, status: :created, location: @user }
    end
    
  end

  def destroy
    @user = Relationship.find_by(id: params[:id]).followed
    current_user.unfollow(@user)
    respond_to do |format|
      format.html { redirect_to "/users/#{@user.id}/show" }
      format.js 
      format.json { render json: @user, status: :destroy, location: @user }
    end
  end
end
