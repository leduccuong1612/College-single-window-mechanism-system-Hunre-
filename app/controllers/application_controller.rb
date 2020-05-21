class ApplicationController < ActionController::Base
  
  def after_sign_in_path_for(resource)
    @department = Department.find_by id: current_user.department_id
    if resource.manager?
      return manager_index_path
    elsif resource.student?
      return root_path
    elsif resource.staff?
      return staff_index_path
    end
  end

  
end
