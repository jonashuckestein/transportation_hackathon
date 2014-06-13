module ApplicationHelper
  def set_page_title(title)
    content_for :title, title
  end

  def add_body_class(new_class)
    content_for :body_class, " #{new_class}"
  end

  def format_phone_number(digits, with_country_code=false, country_code=nil)
    PhoneNumber.format(digits, with_country_code, country_code)
  end

  def format_duration(total_seconds, format=:precise)
    if format == :precise
      seconds = total_seconds % 60
      minutes = (total_seconds / 60) % 60
      hours = total_seconds / (60 * 60)
      if hours.floor > 0
        format("%02dh%02dm%02ds", hours, minutes, seconds) #=> "01h00m00s"
      else
        format("%02dm%02ds", minutes, seconds) #=> "00m00s"
      end
    elsif(format == :minutes)
      [1, (total_seconds / 60).floor].max
    end
  end

  def tel_link_to(digits)
    link_to(digits, "tel:#{PhoneNumber.normalize(digits)}")
  end

  def flag_tag(flag="us", classes="")
    raw %{<span class="flag flag-#{flag} #{classes}" title="Flag: #{flag}"></span>}
  end
end
