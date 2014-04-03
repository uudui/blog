class UnlikesController < ApplicationController
  def create
    @unlike = Unlike.new(:post_id => params[:post_id], :user_id => current_user.id)
    @unlike.save
  end

  def destroy
    @unlike.destroy
    respond_to do |format|
      format.html { redirect_to likes_url }
      format.json { head :no_content }
    end
  end
end