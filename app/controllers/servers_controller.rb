class ServersController < ApplicationController
  before_action :set_server, only: [:show, :update, :destroy]

  # GET /servers
  # GET /servers.json
  def index
    @servers = Server.all.where(params['server'].present? ? server_params : {})
  end

  # GET /servers/1
  # GET /servers/1.json
  def show
  end

  # POST /servers
  # POST /servers.json
  def create
    @server = Server.new(server_params)

    if @server.save
      render :show, status: :created, location: @server
    else
      render json: @server.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /servers/1
  # PATCH/PUT /servers/1.json
  def update
    if @server.update(server_params)
      render :show, status: :ok, location: @server
    else
      render json: @server.errors, status: :unprocessable_entity
    end
  end

  # DELETE /servers/1
  # DELETE /servers/1.json
  def destroy
    @server.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_server
      @server = Server.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def server_params
      params.require(:server).permit(:name, :census_plus_datum_id)
    end
end
