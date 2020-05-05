module UsersHelper
  def role_name(role)
    if role == "student"
      "Sinh Viên"
    elsif role == "manager"
      "Cán Bộ Một Cửa"
    elsif role == "staff"
      "Cán Bộ Phòng Ban"
    end
  end
end