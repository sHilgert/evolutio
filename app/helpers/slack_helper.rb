module SlackHelper
  def sign_in_with_slack_button
    %Q(<a href="#{user_slack_omniauth_authorize_path}"><img alt="Fazer login com Slack" height="40" width="172" src="https://platform.slack-edge.com/img/sign_in_with_slack.png" srcset="https://platform.slack-edge.com/img/sign_in_with_slack.png 1x, https://platform.slack-edge.com/img/sign_in_with_slack@2x.png 2x" /></a>).html_safe
  end
end
