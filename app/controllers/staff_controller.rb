class StaffController < ApplicationController
  def index
    @department = Department.find_by id: current_user.department_id
    @requests = Request.select_staff_request(current_user.department_id).order_desc.page(params[:page]).per(13)
  end 
end
