class ForumsController < ApplicationController
	def index
		@board = Board.find(params[:board_id])
	end
	def show
		@board = Board.find(params[:board_id])
		@forum = Forum.find(params[:id])
	end
	def  new
		@board = Board.find(params[:board_id])
		@forum = Forum.new
	end
	def edit
		@board = Board.find(params[:board_id])
		@forum = Forum.find(params[:id])
	end
	def update
		@board = Board.find(params[:board_id])
		forum = Forum.find(params[:id])
		forum.board = @board
		if forum.update(forum_params)
			flash[:notice] = "Your Forum Topic was edited successfully."
			redirect_to board_forum_path forum.board, forum
		else
			flash[:alert] = "There was a problem editing your Forum Topic."
			redirect_to edit_board_forum_path forum
		end
	end
	def create
		@board = Board.find(params[:board_id])
 		forum = Forum.new(forum_params)
 		forum.board = @board
		if forum.save
			flash[:notice] = "Your Forum Topic was created successfully."
			redirect_to board_forum_path @board, forum
		else
			flash[:alert] = "There was a problem saving your Forum Topic."
			redirect_to new_board_forum_path
	 	end
	end
	def destroy
		@board = Board.find(params[:board_id])
		forum = Forum.find(params[:id])
		forum.board = @board
		if forum.delete
			flash[:notice] = "Your Forum Topic was deleted successfully."
			redirect_to board_forums_path forum.board
		else
			flash[:alert] = "There was a problem deleting your Forum Topic."
			redirect_to board_forum_path forum.board
	 	end
	end
	private
	def forum_params
 		params.require(:forum).permit(:forum)
	end
end