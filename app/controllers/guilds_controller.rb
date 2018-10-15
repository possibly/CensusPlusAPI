class GuildsController < ApplicationController
  before_action :set_guild, only: [:show, :update, :destroy]

  # GET /guilds
  # GET /guilds.json
  def index
    @guilds = Guild.all
  end

  # GET /guilds/1
  # GET /guilds/1.json
  def show
  end

  # POST /guilds
  # POST /guilds.json
  def create
    @guild = Guild.new(guild_params)

    if @guild.save
      render :show, status: :created, location: @guild
    else
      render json: @guild.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /guilds/1
  # PATCH/PUT /guilds/1.json
  def update
    if @guild.update(guild_params)
      render :show, status: :ok, location: @guild
    else
      render json: @guild.errors, status: :unprocessable_entity
    end
  end

  # DELETE /guilds/1
  # DELETE /guilds/1.json
  def destroy
    @guild.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guild
      @guild = Guild.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def guild_params
      params.require(:guild).permit(:census_plus_datum, :server_id)
    end
end
