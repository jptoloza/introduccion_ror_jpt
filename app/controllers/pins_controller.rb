class PinsController < ApplicationController
    load_and_authorize_resource param_method: :my_sanitizer
    #before_action :set_pin, only: [:show, :edit, :update, :destroy]

    # GET /pins
    # GET /pins.json
    def index
        @apins = Pin.where(user_id: current_user.id)
        @pins = Pin.where(user_id: current_user.id).paginate(page: params[:page], per_page: 8)
          .order(updated_at: :desc)
        #    @pins = Pin.where(user_id: current_user.id).order(updated_at: :desc)
    end

    # GET /pins/1
    # GET /pins/1.json
    def show
    end

    # GET /pins/new
    def new
        @pin = Pin.new
    end

    # GET /pins/1/edit
    def edit
    end

    # POST /pins
    # POST /pins.json
    def create

        @pin = current_user.pin.new(pin_params)
        @pin.image.attach(params[:pin][:image])

        respond_to do |format|
            if @pin.save
                format.html { redirect_to @pin, notice: t('activerecord.helpers.pin.created') }
                format.json { render :show, status: :created, location: @pin }
            else
                format.html { render :new }
                format.json { render json: @pin.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /pins/1
    # PATCH/PUT /pins/1.json
    def update
        respond_to do |format|
            if @pin.update(pin_params)
                format.html { redirect_to @pin, notice: t('activerecord.helpers.pin.updated') }
                format.json { render :show, status: :ok, location: @pin }
            else
                format.html { render :edit }
                format.json { render json: @pin.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /pins/1
    # DELETE /pins/1.json
    def destroy
        @upload = @pin.image
        @pin.destroy
        @upload.purge_later
        respond_to do |format|
            format.html { redirect_to pins_url, notice: t('activerecord.helpers.pin.destroyed') }
            format.json { head :no_content }
        end
    end

    private

    def my_sanitizer
        params.require(:pin).permit(:title, :description, :image)
    end

    def pin_params
        params.require(:pin).permit(:title, :description, :likes, :image)
    end
end
