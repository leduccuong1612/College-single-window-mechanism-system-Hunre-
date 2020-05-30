class StaticPageController < ApplicationController
  def index
    if(params.has_key?(:department))
      @documents = Document.where(department_id: params[:department]).order("created_at desc").page(params[:page]).per(10)
    else
      @documents = Document.all.order("created_at DESC").page(params[:page]).per(10)
    end
  end
  
  def search_document
    @documents = Document.where("title LIKE ?","%#{params[:key]}%").order("created_at desc").page(params[:page]).per(10)
  end
end
