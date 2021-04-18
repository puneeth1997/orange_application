class TestMailer < ApplicationMailer
  default :from => "puneethvarma29@gmail.com"
  
  def aprisal(user)   
    @user = user
    mail(:to => user.email, :subject => "Aprised")
  end

  def points_email(user)
    @user = user
    mail(:to => user.email, :subject => "points")
  end

  def years_email(user)
    @user = user
    mail(:to => user.email, :subject => "experience")
  end
  
end
