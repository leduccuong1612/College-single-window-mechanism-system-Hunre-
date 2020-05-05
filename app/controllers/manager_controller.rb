class ManagerController < ApplicationController
  def index
    @requests = RequestWordsDocument.select_status("0").order_desc
  end

end
