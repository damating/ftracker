class MatchesController < ApplicationController
  before_action :set_match, only: [:show, :edit, :update, :destroy]

  # GET /matches
  # GET /matches.json
  def index
    @matches = Match.all
  end

  # GET /matches/1
  # GET /matches/1.json
  def show
  end

  # GET /matches/new
  def new
    @match = Match.new
  end

  # GET /matches/1/edit
  def edit
  end

  # POST /matches
  # POST /matches.json
  def create
    @match = Match.new(match_params)
      if @match.save
	 flash[:success] = "Match was successfully created.!"
        redirect_to @match
      else
	render :new
      end
  end

  # PATCH/PUT /matches/1
  # PATCH/PUT /matches/1.json
  def update
      if @match.update(match_params)
	 flash[:success] = "Match was successfully updated."
	 redirect_to @match
      else
	render :new
      end
  end

  # DELETE /matches/1
  # DELETE /matches/1.json
  def destroy
    @match.destroy
    respond_to do |format|
      format.html { redirect_to matches_url, notice: 'Match was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_match
      @match = Match.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def match_params
      params.require(:match).permit(:title, :date, :startTime, :player1_id, :player2_id, :player1_goals, :player2_goals)
    end
end
