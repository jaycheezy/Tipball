class TeamsController < ApplicationController
 	before_action :find_team, only: [:show, :edit, :update, :destroy]
	before_action :find_country, only: [:show, :edit, :update, :destroy]

	def new
		@team = Team.new
	end

	def create
		@team = Team.new team_params

		if @team.save
			redirect_to @team, notice: "Hellz Yea Chappy! New Team Added"
		else
			render 'new', notice: "Awwwh Shit"
		end
	end

	def show
		@countries = Country.all.order("title ASC")
		@leagues = League.all
		@teams = Team.all.order("title ASC")
		#@comments = Comment.all
		@comments = Comment.where(team_id: @team.id).order("created_at DESC")
	end


	def edit
	end

	def update
		if @team.update team_params
			redirect_to @team, notice: "team was saved"
		else
			render 'edit'
		end
	end

	def destroy
		@team.destroy
		redirect_to countries_path
	end

	private

	def team_params
		params.require(:team).permit(:title, :flag, :fans, :facilities1, :facilities2)
	end

	def find_team
		@team = Team.find(params[:id])
	end
	def find_country
		@country = Country.find(params[:id])
	end
	def find_comment
		@comment = Comment.find(params[:id])
	end

end
