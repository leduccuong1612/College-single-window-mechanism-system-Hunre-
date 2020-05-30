class CheckingMailer < ApplicationMailer
  def new_checking_email
    @checking = params[:request]
    mail(to: @checking.user.email, subject: "Biểu Mẫu Của Bạn Đang Được Xử Lý")
  end
end
