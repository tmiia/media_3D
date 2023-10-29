class DebateResponsesController < ApplicationController
    before_action :authenticate_user!, only: [:create] # Vous pouvez ajuster la gestion de l'authentification
  
    def create
      @debate = Debate.find(params[:debate_id])
      @response = @debate.debate_responses.new(response_params)
      @response.user = current_user
  
      if @response.save
        redirect_to @debate, notice: "Réponse ajoutée avec succès."
      else
        render 'debates/show'
      end
    end
  
    private
  
    def response_params
      params.require(:debate_response).permit(:content)
    end
end