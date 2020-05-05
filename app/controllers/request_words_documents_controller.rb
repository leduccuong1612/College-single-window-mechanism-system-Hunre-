class RequestWordsDocumentsController < ApplicationController
  def new
    @request = current_user.request_words_documents.build
    @document_id = params[:document_id]
  end

  def create
    @request = current_user.request_words_documents.build(request_params)
    if @request.save
      redirect_to root_path
    end
  end 

  def edit
    @request = RequestWordsDocument.find_by id: params[:id]
  end 

  def update
    @request = RequestWordsDocument.find_by id: params[:id]
    @user_mailer = @request.user
    if @request.update(update_request_params)
      NotificationMailer.with(request_words_document: @user_mailer).new_notification_email.deliver_later
      redirect_to manager_index_path
    end
  end
  
  private
    def update_request_params
      update_request =  params.require(:request_words_document).permit(:content)
      update_request[:status] = params[:request_words_document][:status].to_i
      return update_request
    end

    def request_params
      update_request =  params.require(:request_words_document).permit(:content, :title, :words_document_id, :words,:pdfs)
    end


  end