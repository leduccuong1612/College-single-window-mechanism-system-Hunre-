class RequestsController < ApplicationController
  def new
    @request = current_user.requests.build
    @document_id = params[:document_id]
  end

  def create
    @request = current_user.requests.build request_params
    if @request.save    
      redirect_to root_path  
      Libreconv.convert(ActiveStorage::Blob.service.send(:path_for,@request.files.key),"public/pdfs/test.pdf")
      @request.pdfs.attach(io: File.open("public/pdfs/test.pdf"), filename: 'file.pdf')
      flash[:primary] = "Gửi Biểu Mẫu Thành Công, Kết Quả Sẽ Được Thông Báo Qua Email Của Bạn !!"

    end
  end 

  def edit
    if current_user.staff?
      @department = Department.find_by id: current_user.department_id
    end
      @request = Request.find_by id: params[:id]
  end 

  def update
    @request = Request.find_by id: params[:id]
    @user_mailer = @request
    if @request.update(update_request_params)
      if update_request_params[:status] == 1 
        CheckingMailer.with(request: @user_mailer).new_checking_email.deliver_later
      elsif update_request_params[:status] == 2
        FailMailer.with(request: @user_mailer).new_fail_email.deliver_later
      elsif update_request_params[:status] == 4
        FailMailer.with(request: @user_mailer).new_result_email.deliver_later
      end
    end
    if current_user.manager?
      redirect_to manager_index_path
    elsif current_user.staff?
      redirect_to staff_index_path
    else
      redirect_to manager_index_path
    end
  end

  private
    def update_request_params
      update_request = params.require(:request).permit(:manager_content, :staff_content)
      update_request[:status] = params[:request][:status].to_i
      return update_request
    end

    def request_params
      params.require(:request).permit(:student_content, :title, :document_id, :department_id, :files, :pdfs)
    end

  end