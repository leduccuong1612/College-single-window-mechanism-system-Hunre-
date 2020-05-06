class RequestsController < ApplicationController
  def new
    @request = current_user.requests.build
    @document_id = params[:document_id]
  end

  def create
    @request = current_user.requests.build request_params
    if @request.save      
      Libreconv.convert(ActiveStorage::Blob.service.send(:path_for,@request.files.key),"public/pdfs/test.pdf")
      @request.pdfs.attach(io: File.open("public/pdfs/test.pdf"), filename: 'file.pdf')
      flash[:primary] = "Gửi Biểu Mẫu Thành Công, Kết Quả Sẽ Được Thông Báo Qua Email Của Bạn !!"
      redirect_to root_path
    end
  end 

  def edit
    @request = Request.find_by id: params[:id]
  end 

  def update
    @request = Request.find_by id: params[:id]
    @user_mailer = @request.user
    if @request.update(update_request_params)
      NotificationMailer.with(document: @user_mailer).new_notification_email.deliver_later
      redirect_to manager_index_path
    end
  end
  
  private
    def update_request_params
      update_request = params.require(:request).permit(:content)
      update_request[:status] = params[:request][:status].to_i
      return update_request
    end

    def request_params
      params.require(:request).permit(:student_content, :title, :document_id, :files)
    end

  end