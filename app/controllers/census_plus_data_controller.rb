class CensusPlusDataController < ApplicationController
  before_action :set_census_plus_datum, only: [:show, :update, :destroy]

  # GET /census_plus_data
  # GET /census_plus_data.json
  def index
    @census_plus_data = CensusPlusDatum.all
    if params['servers'].present? && servers_params.present?
      @census_plus_data = @census_plus_data.joins(:servers).where(servers: {}.merge(servers_params))
    end

    if params['players'].present? && players_params.present?
      @census_plus_data = @census_plus_data.joins(:players).where(players: {}.merge(players_params))
    end

    if params['guilds'].present? && guilds_params.present?
      @census_plus_data = @census_plus_data.joins(:guilds).where(guilds: {}.merge(guilds_params))
    end

    if params['times'].present?
      if times_params[:exactly].present?
        @census_plus_data = @census_plus_data.where(created_at: times_params[:exactly])
      else
        if times_params[:before].present?
          @census_plus_data = @census_plus_data.where('census_plus_data.created_at <= ?', times_params[:before])
        end

        if times_params[:after].present?
          @census_plus_data = @census_plus_data.where('census_plus_data.created_at >= ?', times_params[:after])
        end
      end
    end

    if params['user_id'].present?
      @census_plus_data = @census_plus_data.where(user_id: params['user_id'])
    end
  end

  # GET /census_plus_data/1
  # GET /census_plus_data/1.json
  def show
  end

  # POST /census_plus_data
  # POST /census_plus_data.json
  def create
    @census_plus_datum = CensusPlusDatum.new(census_plus_datum_params)
    if User.where(id: params[:user_id]).first_or_create && @census_plus_datum.save
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
      params.permit(:file, :user_id)
    end

    def servers_params
      params.require(:servers).permit(:id, :name)
    end

    def players_params
      params.require(:players).permit(:id, :name, :faction, :race, :klass, :level, :guild_name, :guild_rank, :guild_rank_index)
    end

    def guilds_params
      params.require(:guilds).permit(:id, :name, :faction)
    end

    def times_params
      params.require(:times).permit(:before, :after, :exactly)
    end
end
