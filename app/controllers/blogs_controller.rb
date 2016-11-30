class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  # GET /blogs
  def index
    @blog = Blog.new
  end

  # GET /blogs/1
  def show
    @reply = Reply.new
  end

  # POST /blogs
  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      message = @blog.save ? 'Blog was successfully created.' : 'failed.'
      format.html { redirect_to :root, notice: message }
    end
  end

  # POST /likes/1
  def like
    blog = Blog.find(params[:blog_id])

    respond_to do |format|
      message = blog.increment(:like).save ? 'Success' : 'Failed'
      format.html { redirect_to request.referer, notice: message }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.fetch(:blog, {})
      params.require(:blog).permit(:body, :like)
    end
end
