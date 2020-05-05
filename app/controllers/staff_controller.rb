class StaffController < ApplicationController
  def index
    @requests = RequestWordsDocument.select_status("1").order_desc.page(params[:page]).per(10)
  end 
end
