module DocumentHelper
  def department_type(department_type)
    if department_type == "Công Tác sinh Viên"
      content_tag :span, "#{department_type}", class: "tag is-primary"
    elsif department_type == "Đào Tạo"
      content_tag :span, "#{department_type}", class: "tag is-link"
    elsif department_type == "Tài Chính - Kế Toán"
      content_tag :span, "#{department_type}", class: "tag is-warning"
    elsif department_type == "Cơ Sở Vật Chất"
      content_tag :span, "#{department_type}", class: "tag is-info"
    elsif department_type == "Y Tế"
      content_tag :span, "#{department_type}", class: "tag has-text-danger"
    else
      ""
    end
  end
end
