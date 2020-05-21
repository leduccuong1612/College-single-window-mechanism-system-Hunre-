module RequestsHelper
  def days_till_expiration(created_time,max_document_time)

    start = created_time
    now = Time.zone.now

    start_day = created_time.mday
    now_day = Time.zone.now.mday
    day_pass_by = (now_day - start_day)
    day_remants = max_document_time - day_pass_by

    start_hour = created_time.hour
    now_hour = Time.zone.now.hour
    hour_pass_by = (now_hour - start_hour)
    hour_remants = max_document_time*24 - hour_pass_by

    minutes_pass_by = (now - start)/ 1.minutes
    minutes_remants = (max_document_time*24*60 - minutes_pass_by).round

    if day_remants >1
      content_tag :p, "yêu cần còn #{day_remants} ngày để xử lý", class: "tag is-primary"
    elsif hour_remants > 1
      content_tag :p, "yêu cần còn #{hour_remants} giờ để xử lý", class: "tag is-warning"
    else
      content_tag :p, "yêu cần còn #{minutes_remants} phút để xử lý", class: "tag is-warning"
    end
  end
end
