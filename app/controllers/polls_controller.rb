class PollsController < ApplicationController
  before_action :set_poll, only: %i[ show edit update destroy ]
  protect_from_forgery with: :null_session

  # GET /polls or /polls.json
  def index
    @polls = Poll.all
  end

  # GET /polls/1 or /polls/1.json
  def show
  end

  # GET /polls/new
  def new
    @poll = Poll.new
  end

  # GET /polls/1/edit
  def edit
  end

  # POST /polls or /polls.json
  def create
    @poll = Poll.new(poll_params)

    respond_to do |format|
      if @poll.save
        format.html { redirect_to poll_url(@poll), notice: "Poll was successfully created." }
        format.json { render :show, status: :created, location: @poll }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @poll.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /polls/1 or /polls/1.json
  def update
    respond_to do |format|
      if @poll.update(poll_params)
        format.html { redirect_to poll_url(@poll), notice: "Poll was successfully updated." }
        format.json { render :show, status: :ok, location: @poll }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @poll.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /polls/1 or /polls/1.json
  def destroy
    @poll.destroy

    respond_to do |format|
      format.html { redirect_to polls_url, notice: "Poll was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def vote
    @poll = Poll.find(params[:id])
    if !Vote.user_already_voted?(current_user, @poll)
      case params[:option]
      when 'option_1'
        @poll.increment!(:count_1)
      when 'option_2'
        @poll.increment!(:count_2)
      when 'option_3'
        @poll.increment!(:count_3)
      end

      # Crée un enregistrement de vote pour l'utilisateur actuel
      Vote.create(user: current_user, poll: @poll)

      if @poll.debate
        @poll.debate.update(results_visible: true)
      end

      render json: { success: true }
    else
      render json: { success: false, message: "Vous avez déjà voté dans ce sondage." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poll
      @poll = Poll.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def poll_params
      params.require(:poll).permit(:question, :label_1, :count_1, :label_2, :count_2, :label_3, :count_3)
    end
end
