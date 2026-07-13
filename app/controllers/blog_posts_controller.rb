class BlogPostsController < ApplicationController
  def index
    @blogPosts = BlogPost.all
  end

  def show
    @blogPost = BlogPost.find(params[:id])
  end
end
