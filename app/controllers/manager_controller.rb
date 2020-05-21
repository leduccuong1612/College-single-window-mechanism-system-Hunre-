class ManagerController < ApplicationController
  def index
    if(params.has_key?(:status))
      @requests = Request.where(status: params[:status]).order_desc.page(params[:page]).per(6)
    else
      @requests = Request.select_status("0").order_desc.page(params[:page]).per(6)
    end
  end

  def chart
  end

  def demo_by_click
    @request = Request.find_by_id(params[:id])
    respond_to do |format|
      format.js
    end
  end

end
