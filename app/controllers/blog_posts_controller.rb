class BlogPostsController < ApplicationController
  allow_unauthenticated_access only: %i[ index show ]

  def index
    @blogPosts = BlogPost.all
  end

  def show
    @blogPost = BlogPost.find(params[:id])
  end

  def edit
    @blogPost = BlogPost.find(params[:id])
  end

  def new
    @blogPost = BlogPost.new
  end

  def create
    @blogPost = BlogPost.new(blog_params)
    if @blogPost.save
      redirect_to @blogPost
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def blog_params
      params.expect(product: [ :title, :body ])
    end

  def update
    @blogPost = BlogPost.find(params[:id])
    if @blogPost.update(blog_paramss)
      redirect_to @blogPost
    else
      render :edit, status: :unprocessable_entity
    end
  end
end
