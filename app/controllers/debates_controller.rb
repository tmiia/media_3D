class DebatesController < ApplicationController
  before_action :set_debate, only: %i[ show edit update destroy ]

  # GET /debates or /debates.json
  def index
    @debates = Debate.all
    @categories = Category.all
  end

  def debate_of_the_day
    @debate = Debate.first
    @poll = @debate.poll
  end

  # GET /debates/1 or /debates/1.json
  def show
    @debate = Debate.find(params[:id])
    @poll = @debate.poll

    # if current_user && current_user.voted?(@poll)
    #   @debate.update(results_visible: true) if @poll.present?
    # end
  end

  # GET /debates/new
  def new
    @debate = Debate.new
  end

  # GET /debates/1/edit
  def edit
  end

  # POST /debates or /debates.json
  def create
    @debate = Debate.new(debate_params)

    respond_to do |format|
      if @debate.save
        format.html { redirect_to debate_url(@debate), notice: "Debate was successfully created." }
        format.json { render :show, status: :created, location: @debate }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @debate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /debates/1 or /debates/1.json
  def update
    respond_to do |format|
      if @debate.update(debate_params)
        format.html { redirect_to debate_url(@debate), notice: "Debate was successfully updated." }
        format.json { render :show, status: :ok, location: @debate }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @debate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /debates/1 or /debates/1.json
  def destroy
    @debate.destroy

    respond_to do |format|
      format.html { redirect_to debates_url, notice: "Debate was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_debate
      @debate = Debate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def debate_params
      params.require(:debate).permit(:title, :lead, :context)
    end
end
