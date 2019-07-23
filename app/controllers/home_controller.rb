class HomeController < ApplicationController


	def index
		@pins = Pin.paginate(page: params[:page], per_page: 4)
					.order(id: :desc)

	end
end
