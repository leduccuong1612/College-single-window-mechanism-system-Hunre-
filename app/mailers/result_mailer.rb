class ResultMailer < ApplicationMailer
  def new_result_email
    @result = params[:request]
    mail(to: @result.user.email, subject: "Yêu Cầu Của Bạn Đã Được Xử Lý Xong")
  end
end
 