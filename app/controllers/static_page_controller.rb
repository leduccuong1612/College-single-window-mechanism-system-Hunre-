class StaticPageController < ApplicationController
  def index
    if(params.has_key?(:department))
      @documents = WordsDocument.where(department: params[:department]).order("created_at desc").page(params[:page]).per(10)
    else
      @documents = WordsDocument.all.order("created_at DESC").page(params[:page]).per(10)
    end
  end
end
