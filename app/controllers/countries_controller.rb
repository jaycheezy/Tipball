class CountriesController < ApplicationController
	before_action :find_country, only: [:show, :edit, :update, :destroy]

    def home
  		@countries = Country.all.order("title ASC")
  		@leagues = League.all
  		@teams = Team.all.order("title ASC")
    end

	def new
		@country = Country.new
	end

	def create
		@country = Country.new country_params

		if @country.save
			redirect_to @country, notice: "Hellz Yea Chappy! New Country Added"
		else
			render 'new', notice: "Awwwh Shit"
		end
	end

	def show
	end

	def edit
	end

	def update
		if @country.update country_params
			redirect_to @country, notice: "country was saved"
		else
			render 'edit'
		end
	end

	def destroy
		@country.destroy
		redirect_to countries_path
	end


	

	private


	def country_params
		params.require(:country).permit(:title, :flag)
	end

	def find_country
		@country = Country.find(params[:id])
	end



end
