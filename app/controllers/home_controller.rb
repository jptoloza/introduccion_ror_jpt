class HomeController < ApplicationController


	def index
		@query = params[:search]

		if @query.present?
			@pins = Pin
						.where('title ilike ? OR description ilike ?', "%#{@query}%", "%#{@query}%")
						.paginate(page: params[:page], per_page: 8)
						.order(updated_at: :desc)
		else
			@pins = Pin.paginate(page: params[:page], per_page: 8)
					.order(updated_at: :desc)
		end


	end


	def show
  		@pin = Pin.find(params[:id])
  	end

end
