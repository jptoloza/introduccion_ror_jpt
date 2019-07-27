class LikesController < ApplicationController
	before_action :find_pin
	before_action :find_like, only: [:destroy]


	def create

		if already_liked?
			flash[:notice] = "You can't like more than once"
		else
    		@pin.likes.create(user_id: current_user.id)	
		end
		redirect_to pin_path(@pin)
	end
  

	def destroy
		if !(already_liked?)
			flash[:notice] = "Cannot unlike"
		else
			@like.destroy
		end
  		redirect_to pins_path(@pin)
	end



	private

	def already_liked?
		Like.where("user_id = ? AND pin_id = ?",current_user.id,params[:pin_id]).exists?
	end

	def find_pin
		@pin = Pin.find(params[:pin_id])
	end

	def find_like
		@like = @pin.likes.find(params[:id])
	end

end
