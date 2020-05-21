class DocumentController < ApplicationController

  def document_by_department
    @filtered_document = Document.where(department_id: params[:selected_department])
  end

end