class BoardsController < ApplicationController
	def index
		@boards = Board.all
	end
	def show
		@board = Board.find(params[:id])
	end
	def  new
		@board = Board.new
	end
	def edit
		@board = Board.find(params[:id])
	end
	def update
		board = Board.find(params[:id])
		if board.update(board_params)
			flash[:notice] = "Your Board was edited successfully."
			redirect_to(board_path(board))
		else
			flash[:alert] = "There was a problem editing your Board."
			redirect_to(edit_board_path(board))
		end
	end
	def create
 		board = Board.new(board_params)
		if board.save
			flash[:notice] = "Your Board was created successfully."
			redirect_to board_path board
		else
			flash[:alert] = "There was a problem saving your Board."
			redirect_to new_board_path
	 	end
	end
	def destroy
		board = Board.find(params[:id])
		if board.delete
			flash[:notice] = "Your Board was deleted successfully."
			redirect_to boards_path
		else
			flash[:alert] = "There was a problem deleting your Board."
			redirect_to board_path board
	 	end
	end
	private
	def board_params
 		params.require(:board).permit(:board)
	end
end