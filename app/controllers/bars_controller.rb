class BarsController < ApplicationController
  before_action :set_bar, only: [:show, :update, :destroy]

  # GET /bars
  def index
    @bars = Bar.all

    render json: @bars
  end

  # GET /bars/1
  def show
    render json: @bar
  end

  # POST /bars
  def create
    @bar = Bar.new(bar_params)

    if @bar.save
      render json: @bar, status: :created, location: @bar
    else
      render json: @bar.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bars/1
  def update
    if @bar.update(bar_params)
      render json: @bar
    else
      render json: @bar.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bars/1
  def destroy
    @bar.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bar
      @bar = Bar.find(params[:id])
    end

    def bar_params
      ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    end

    # Only allow a trusted parameter "white list" through.
    # params.require(:bar).permit(:name, :url, :description, :why, :numofvisits, :photo, :notes, :city_id, :hide)
    # NOTE: UPDATE THE ABOVE LATER with something like:

   #    def deserialized_params
   #      ActionController::Parameters.new(
   #        ActiveModelSerializers::Deserialization.jsonapi_parse!(params)
   #      )
   #    end
   #
   #    def bar_params
   #      deserialized_params.permit(:x,:y...)
   #    end
   #
end
