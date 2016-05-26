class CountriesController < ApplicationController
	before_action :find_country, only: [:show, :edit, :update, :destroy]

    def home
  		@countries = Country.all.order("title ASC")
    end

	def new
		@country = Country.new
	end

	private


	def country_params
		params.require(:country).permit(:title, :flag)
	end

	def find_country
		@country = Country.find(params[:id])
	end



end
