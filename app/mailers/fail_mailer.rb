class FailMailer < ApplicationMailer
  def new_fail_email
    @fail = params[:request]

    mail(to: @fail.user.email, subject: "Biểu Mẫu Của Bạn Không Đạt Yêu Cầu")
  end
end
