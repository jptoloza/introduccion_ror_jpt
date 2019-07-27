class HomeController < ApplicationController


	def index
#		sleep(5)
		@pins = Pin.paginate(page: params[:page], per_page: 8)
					.order(id: :desc)




	end
end
