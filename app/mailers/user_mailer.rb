class UserMailer < ApplicationMailer
  def invitation_mail
    @user = params[:user]
    token = params[:token]
    @invite_domain = @user.roles.pluck(:domain).last
    @url =
      "#{ActionMailer::Base.default_url_options[:host]}/invites?token=#{token}"
    mail(to: @user.email, subject: "Invitation To Join Platform")
  end

  def forgot_mail
    @user = params[:user]
    token = params[:token]
    @reset_link = "Reset password"
    @url =
      "#{ActionMailer::Base.default_url_options[:host]}/invites?token=#{token}"
    mail(to: @user.email, subject: "Reset Password")
  end

  def notify_access_token
    @user = params[:user]
    @access_token = params[:access_token]
    mail(to: @user.email, subject: "A personal access token has been added to your account")
  end
end
