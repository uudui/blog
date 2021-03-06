class LikesController < ApplicationController
  def create
    @like = Like.new(:post_id => params[:post_id], :user_id => current_user.id)
    @like.save
  end

  def destroy
    @like.destroy
    respond_to do |format|
      format.html { redirect_to likes_url }
      format.json { head :no_content }
    end
  end
end
