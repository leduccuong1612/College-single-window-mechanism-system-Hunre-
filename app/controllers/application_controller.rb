class ApplicationController < ActionController::Base
  
  def after_sign_in_path_for(resource)
    if resource.manager?
      return manager_index_path
    else
      return root_path
    end
  end

  
end
