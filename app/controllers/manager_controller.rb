class ManagerController < ApplicationController
  def index
    @requests = Request.select_status("0").order_desc.page(params[:page]).per(5)
  end

end
