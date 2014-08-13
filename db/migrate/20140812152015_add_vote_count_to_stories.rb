class AddVoteCountToStories < ActiveRecord::Migration
  def change
  	add_column :stories, :votes_count, :integer
  end
end
