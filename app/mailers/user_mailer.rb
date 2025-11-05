class UserMailer < ApplicationMailer
    default from: 'no-reply@elrecetariodepeter.cl'

    def welcome_email(user_id)
    @user = User.find(user_id)
    @login_url = "http://localhost:3000/login"
    mail(to: @user.email, subject: "Bienvenido al Recetario de Peter!")
  end
end
