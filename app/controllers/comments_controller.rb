class CommentsController < ApplicationController
	before_action :find_team
	before_action :find_comment, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]

	def index
	end

	def new
		@comment = Comment.new

	end

	def create
		@comment = Comment.new(comment_params)
		@comment.user_id = current_user.id
		@comment.team_id = @team.id

		if @comment.save
			redirect_to @team, notice: "Hellz Yea Chappy! New Comment Added"
		else
			render 'new', notice: "Awwwh Shit"
		end
	end


	def show
	end

	def edit
	end

	def update
		if @comment.update comment_params
			redirect_to @team, notice: "comment was saved"
		else
			render 'edit'
		end
	end

	def destroy
		@comment.destroy
		redirect_to team_path
	end




	private

	def comment_params
		params.require(:comment).permit(:text)
	end

	def find_comment
		@comment = Comment.find(params[:id])
	end

	def find_team
		@team = Team.find(params[:team_id])
	end


end
