# frozen_string_literal: true

class Admins::RegistrationsController < Devise::RegistrationsController
  # include Accessible
  # skip_before_action :check_user, except: [:new, :create]
  # before_action :prevent_signup, only: [:new, :create]

  # def prevent_signup
  #  redirect_to root_path, alert: "Accès refusé. Vous ne pouvez pas vous inscrire en tant qu'administrateur."
  # end
end
