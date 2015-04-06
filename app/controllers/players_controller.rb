class PlayersController < ApplicationController
  before_action :logged_in_player, only: [:edit, :update]
  before_action :set_player, only: [:show, :edit, :update, :destroy]

  # GET /players
  # GET /players.json
  def index
    @players = Player.all
  end

  # GET /players/1
  # GET /players/1.json
  def show
    @player = Player.find(params[:id])
  end

  # GET /players/new
  def new
    @player = Player.new
  end

  # GET /players/signup
  def signup
    @player = Player.new
  end

  # GET /players/1/edit
  def edit
	@player = Player.find(params[:id])
  end

  # POST /players
  # POST /players.json
  def create
    @player = Player.new(player_params)

   # respond_to do |format|
      if @player.save
        flash[:success] = "Player was successfully created.!"
        redirect_to @player
        #format.html { redirect_to @player, notice: 'Player was successfully created.' }
        #format.json { render :show, status: :created, location: @player }
      else 
        render :new
        #format.html { render :new }
        #format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    #end
  end

  # PATCH/PUT /players/1
  # PATCH/PUT /players/1.json
  def update
    #respond_to do |format|
      @player = Player.find(params[:id])
	@player.avatar = nil
      if @player.update(player_params)
	 flash[:success] = "Player was successfully updated."
	 redirect_to @player
       # format.html { redirect_to @player, notice: 'Player was successfully updated.' }
        #format.json { render :show, status: :ok, location: @player }
      else
        render 'edit'
        #format.html { render :edit }
        #format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    #end
  end

  # DELETE /players/1
  # DELETE /players/1.json
  def destroy
    @player.destroy
    respond_to do |format|
      format.html { redirect_to players_url, notice: 'Player was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_params
      params.require(:player).permit(:first_name, :last_name, :email, :password, :password_confirmation, :avatar)
    end

    #Confirms a logged-in player
    def logged_in_player
      unless logged_in?
       flash[:danger] = "Please log in."
       redirect_to login_url
      end
    end
end
