class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_filter :authorize, only: [:new, :edit, :update, :destroy]

  def index
    if params[:day]
      @posts = Post.where(
          'year = ? and month = ? and day = ?',
          params[:year], params[:month], params[:day]
      )
    elsif params[:month]
      @posts = Post.where('year = ? and month = ?', params[:year], params[:month])
    elsif params[:year]
      @posts = Post.where('year = ?', params[:year])
    else
      @posts = Post.all
    end

    @posts = @posts.order('created_at DESC')
    @posts = @posts.paginate(page: params[:page], per_page: BLOG['posts_per_page'])

  end

  def show
    if params[:slug]
      @post = Post.find_by_permalink(request.fullpath)
    end
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.created_at = Time.now
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post.permalink, notice: 'Post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post.permalink, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find_by_slug(params[:slug]) || Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content)
    end
end
