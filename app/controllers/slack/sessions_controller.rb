module Slack
  class SessionsController < ApplicationController
    before_action :ensure_no_error!
    before_action :ensure_ok!

    expose(:slack_client) { Slack::Web::Client.new }
    expose(:oauth_token) do
      slack_client.oauth_access(
        client_id: '178369105184.359005625602',
        client_secret: 'a4e981c2482e35856f5ef642234c7f77',
        redirect_uri: slack_login_url,
        code: params[:code])
    end
    expose(:slack_team_from_token) { oauth_token.team }
    expose(:slack_user_from_token) { oauth_token.user }
    expose(:team_id) { slack_team_from_token.id }
    expose(:user) do
      user = User.find_by_email(slack_user_from_token.email)
      if user.present?
        user
      else
        user = User.new(email: slack_user_from_token.email, password: slack_user_from_token.id)
        user.save
        user
      end
    end

    def create
      sign_in_and_redirect(user)
    end

    private
    def ensure_no_error!
      return unless params[:error]

      message = if params[:error] == 'access_denied'
                  'You canceled sign in with Slack'
                else
                  'An error occurred when signing in with Slack'
                end

      redirect_to new_user_session_path, alert: message
    end

    def ensure_ok!
      return if oauth_token['ok']

      message = 'An error occurred when signing in with Slack'

      redirect_to new_user_session_path, alert: message
    end
  end
end
