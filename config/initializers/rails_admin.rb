RailsAdmin.config do |config|
  config.asset_source = :sprockets

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/railsadminteam/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.authorize_with do
    redirect_to main_app.root_path unless current_admin
  end

  config.authenticate_with do
    warden.authenticate! scope: :admin
  end
  config.current_user_method(&:current_admin)

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.model Article do
    create do
      field :title
      field :lead
      field :slug
      field :thumbnail
      field :text_content
      field :media
      field :mood_value
      field :keywords
      field :category_id, :enum do
        enum do
          Article.category_options
        end
      end
      field :is_longformat
      field :is_draft
    end

    edit do
      field :title
      field :lead
      field :slug
      field :thumbnail
      field :text_content
      field :media
      field :mood_value
      field :keywords
      field :category_id, :enum do
        enum do
          Article.category_options
        end
      end
      field :is_longformat
      field :is_draft
    end

  end
end
