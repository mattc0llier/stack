class StoriesController < ApplicationController
	
	#links with our method at the bottom
	before_action :find_story, only: [:show, :edit, :update, :destroy]

	def index
		# @string = "My string of characters"
		# @time = Time.now
		if params[:sort] == "popular"
			@stories = Story.all.order('votes_count DESC')
		elsif params[:sort] == "featured"
			@stories = Story.where(is_featured: true)
		else
			@stories = Story.all.order('created_at DESC')
		end
	end

	def show
		# refactor teh code to be DRY
		# @story = Story.find(params[:id])
	end

	def new
		@story = Story.new
		
	end

	def create
		@story = Story.new(story_params)
		if @story.save
			flash[:success] = "Thank you for submiting your story!"
			redirect_to root_path
		else
			flash[:error] = "not this time buddy, change it!"
			render :new
		end	
		
	end

	def edit
		# @story = Story.find(params[:id])
	end

	def update
		# @story = Story.find(params[:id])
		if @story.update(story_params)
			flash[:success] = "Thank you for updating your story"
			redirect_to story_path(@story)
		else
			flash[:error] = "not this time buddy, change it!"
			render :edit
		end
	end

	def destroy
		# @story = Story.find(params[:id])
		if @story.present?
			flash[:success] = "Successfully destroyed '#{@story.title}'" 
			@story.destroy
		else 
			flash[:error] = "Oops, no story forunt with id #{params [:id]}"
		end
		redirect_to root_path
		
	end

	private
	def story_params
		params.require(:story).permit(:title, :url, :description)
	end

 # Code after refactoring
	def find_story
		@story = Story.find(params[:id])
	end

end
