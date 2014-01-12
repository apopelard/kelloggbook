class UserMailer < ActionMailer::Base
  default :from => "meetingapp.dev@gmail.com"

  def registration_confirmation(user)
    @user = user
    mail(:to => "#{user.full_name} <#{user.email}>", :subject => "Kelloggbook Registration")
  end

  def agreement_confirmation(user)
    @user = user
    mail(:to => "#{user.full_name} <#{user.email}>", :subject => "Kelloggbook Profile Release")
  end
end
