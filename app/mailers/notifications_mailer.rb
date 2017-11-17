class NotificationsMailer < ApplicationMailer
  def new_evaluation_available(user_id, evaluation_id)
    @user = User.find(user_id)
    @evaluation_link = "#{ActionMailer::Base.default_url_options[:host]}/evaluations/#{evaluation_id}"
    mail(to: @user.email, subject: 'Avaliação disponível para ser respondida.')
  end
end
