class DocumentController < ApplicationController

  def document_by_department
    @filtered_document = Document.where(department_id: params[:selected_department])
  end

  def info_by_document
    @filtered_info = Document.find_by_id(params[:selected_document])
  end
  
end