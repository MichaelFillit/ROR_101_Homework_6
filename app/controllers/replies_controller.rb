class RepliesController < ApplicationController
	def index
		@board = Board.find(params[:board_id])
		@forum = Forum.find(params[:forum_id])
	end
	def show
		@board = Board.find(params[:board_id])
		@forum = Forum.find(params[:forum_id])
		@reply = Reply.find(params[:id])
	end
	def  new
		@board = Board.find(params[:board_id])
		@forum = Forum.find(params[:forum_id])
		@reply = Reply.new
	end
	def edit
		@board = Board.find(params[:board_id])
		@forum = Forum.find(params[:forum_id])
		@reply = Reply.find(params[:id])
	end
	def create
		@board = Board.find(params[:board_id])
		@forum = Forum.find(params[:forum_id])
 		reply = Reply.new(reply_params)
 		reply.forum = @forum
		if reply.save
			flash[:notice] = "Your Reply was created successfully."
			redirect_to board_forum_reply_path @board, @forum, reply
		else
			flash[:alert] = "There was a problem saving your Reply."
			redirect_to new_board_forum_reply_path
	 	end
	end
	def update
		@board = Board.find(params[:board_id])
		@forum = Forum.find(params[:forum_id])
		reply = Reply.find(params[:id])
		reply.forum = @forum
		if reply.update(reply_params)
			flash[:notice] = "Your Reply was edited successfully."
			redirect_to board_forum_reply_path @board, @forum, reply
		else
			flash[:alert] = "There was a problem editing your Reply."
			redirect_to edit_board_forum_reply_path reply
		end
	end
	def destroy
		@board = Board.find(params[:board_id])
		@forum = Forum.find(params[:forum_id])
		reply = Reply.find(params[:id])
		reply.forum = @forum
		if reply.delete
			flash[:notice] = "Your Reply was deleted successfully."
			redirect_to board_forum_replies_path @board.id, reply.forum
		else
			flash[:alert] = "There was a problem deleting your Reply."
			redirect_to board_forum_replies_path @board.id, reply.forum
	 	end
	end
	private
	def reply_params
 		params.require(:reply).permit(:reply)
	end
end