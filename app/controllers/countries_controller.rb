class CountriesController < ApplicationController
  def home
  	 @countries = Country.all.order("title ASC")
  end
end
