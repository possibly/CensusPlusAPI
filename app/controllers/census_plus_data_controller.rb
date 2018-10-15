class CensusPlusDataController < ApplicationController
  before_action :set_census_plus_datum, only: [:show, :update, :destroy]

  # GET /census_plus_data
  # GET /census_plus_data.json
  def index
    @census_plus_data = CensusPlusDatum.all
  end

  # GET /census_plus_data/1
  # GET /census_plus_data/1.json
  def show
  end

  # POST /census_plus_data
  # POST /census_plus_data.json
  def create
    @census_plus_datum = CensusPlusDatum.new(census_plus_datum_params)

    if @census_plus_datum.save
      render :show, status: :created, location: @census_plus_datum
    else
      render json: @census_plus_datum.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /census_plus_data/1
  # PATCH/PUT /census_plus_data/1.json
  def update
    if @census_plus_datum.update(census_plus_datum_params)
      render :show, status: :ok, location: @census_plus_datum
    else
      render json: @census_plus_datum.errors, status: :unprocessable_entity
    end
  end

  # DELETE /census_plus_data/1
  # DELETE /census_plus_data/1.json
  def destroy
    @census_plus_datum.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_census_plus_datum
      @census_plus_datum = CensusPlusDatum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def census_plus_datum_params
      params.require(:census_plus_datum).permit(:file)
    end
end
