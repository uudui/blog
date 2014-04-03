class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy,:check_up, :check_down]

  before_filter :require_sign_in, :only => [:new, :update, :edit, :update, :check, :check_up, :check_down, :check_next]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.has_checked.order_by_hot.includes(:user)
    if current_user
      @liked_posts = current_user.liked_posts(@posts)
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  def check
    set_check_post
  end

  def check_up
    @post.status = '2'
    @post.save
    set_check_post
    render :check
  end

  def check_down
    @post.status = '3'
    @post.save
    set_check_post
    render :check
  end

  def check_next

  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_url, notice: 'Post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to posts_url, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    def set_check_post
      @post = Post.wait_check.first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:content, :tip)
    end
end
