class ReadsController < ApplicationController
  def create
    @read = current_user.reads.build(article_id: params[:article_id])

    if @read.save
      current_user.increase_consecutive_days
      # Redirigez vers la page de l'article ou une autre page appropriée.
    else
      # Gérez les erreurs, par exemple, si la lecture échoue.
    end
  end
end
