class CommentsController < ApplicationController
  
before_action :find_story, only: [:new, :create]

  def new
  	@comment = @story.comments.new
  end

  def create
  	@comment = @story.comments.new(comment_params)
  	@comment.save

  	redirect_to story_path(@story)
  end

  def destroy
  	@comment = Comment.find(params[:id])
  	@comment.destroy
  	redirect_to story_path(@comment.story)
  end

  private

  def comment_params
		params.require(:comment).permit(:body)
	end


  def find_story
  	@story = Story.find(params[:story_id])
  end

end



	
