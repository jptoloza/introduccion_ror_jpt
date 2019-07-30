class HomeController < ApplicationController


	def index
		@pins = Pin.paginate(page: params[:page], per_page: 8)
					.order(id: :desc)
	end


	def show
  		@pin = Pin.find(params[:id])
  	end

end
