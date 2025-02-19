class UsersController < ApplicationController
  before_action :set_user, only: %i[ show liked feed followers following discover ]

  before_action { authorize (@user || User )}

  private

    def set_user
      if params[:username]
        @user = User.find_by!(username: params.fetch(:username))
      else
        @user = current_user
      end
    end

    def must_be_owner_to_view
      if current_user != @user
        redirect_back fallback_location: root_url, alert: "You're not authorized"
    end
end
end
