class VotesController < ApplicationController

	def create
		@story = Story.find(params[:story_id])
		@vote = @story.votes.new(story_id: params[:story_id], ip_address: request.ip)
		@vote.save
		redirect_to root_path(@story) 
	end

end
