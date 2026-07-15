class BlogPostsController < ApplicationController
  before_action :resume_session # VERIFY
  allow_unauthenticated_access only: %i[ index show ]
  before_action :set_blog_post, only: %i[ show edit update destroy ]
  before_action :ensure_owner!, only: %i[ edit update destroy ]

  def index
    # @blogPosts = BlogPost.all
    @blogPosts = BlogPost.recently_active
    @blogPosts = @blogPosts.where(user: Current.user) if params[:mine] == "true" && Current.user
  end

  def show
  end

  def edit
  end

  def new
    @blogPost = BlogPost.new
  end

  def create
    @blogPost = Current.user.blog_posts.build(blog_params)
    if @blogPost.save
      redirect_to @blogPost
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @blogPost.update(blog_params)
      redirect_to @blogPost
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @blogPost.destroy
    redirect_to blog_posts_path, notice: "Blog post deleted."
  end

  private

  def set_blog_post
    @blogPost = BlogPost.find(params[:id])
  end

  def ensure_owner!
    unless @blogPost.user == Current.user
      redirect_to blog_posts_path, alert: "You are not authorized to modify this post."
    end
  end

  def blog_params
    params.expect(blog_post: [ :title, :body ])
  end
end
