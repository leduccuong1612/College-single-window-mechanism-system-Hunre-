class ManagerController < ApplicationController
  def index
    @requests = Request.select_status("0").order_desc
  end

end
