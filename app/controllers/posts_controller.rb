class PostsController < ApplicationController

  before_action :find_post, only: [:edit, :update, :show, :destroy]

	# Index renders all posts
	def index
		@posts = Post.all
	end

	# Create new post
	def new 
		@post = Post.new
	end

	# Save a post into the SQLite database and flash a message
	def create
		@post = Post.new(post_params)
		if @post.save
			flash[:notice] = "Successfully created post!"
			redirect_to post_path(@post)
		else 
			flash[:alert] = "Error creating new Post!"
			render :new
		end
	end

	# Retrieve the post and render the edit page
	def edit
	end

	# Update the post in the database with new information
	def update
		if @post.update_attributes(post_params)
			flash["notice"] = "Successfully updated post!"
			redirect_to post_path(@posts)
		else
			flash["alert"] = "Error updating post!"
			render :edit
		end
	end

	# Render an individual post after retrieving its id
	def show 
	end

	# Permanently remove a post from the database
	def destroy
		if @post.destroy
			flash[:notice] = "Successfully deleted post!"
			redirect_to posts_path
		else 
			flash["alert"] = "Error updating post!"
		end
	end

	private

	def post_params
		params.require(:post).permit(:title, :body)
	end

	def find_post
		@post = Post.find(params[:id])
	end
	
end
