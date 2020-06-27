class ManagerController < ApplicationController
  respond_to :docx
  def index
    if(params.has_key?(:status))
      @requests = Request.where(status: params[:status].to_i).order_desc.page(params[:page]).per(5)
    elsif(params.has_key?(:department))
      @requests = Request.select_checked_request(params[:department].to_i).order_desc.page(params[:page]).per(5)
    else
      @requests = Request.select_status(0).order_desc.page(params[:page]).per(5)
    end
  end

  def chart
  end

  def dowload
    respond_to do |format|
      format.docx do 
        render docx: 'dowload', filename: 'chart.docx'
      end
    end
  end

  def demo_by_click
    @request = Request.find_by_id(params[:id])
    respond_to do |format|
      format.js
    end
  end

end
