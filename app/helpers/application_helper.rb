module ApplicationHelper

  def bootstrap_class_for flash_type
    case flash_type
    when "success"
      "alert-success alert-dismissible"
    when "error"
      "alert-danger alert-dismissible"
    when "alert"
      "alert-warning alert-dismissible"
    when "notice"
      "alert-info alert-dismissible"
    else
        flash_type.to_s
    end
  end

  def get_rate credit_range
    if credit_range == 'below 600'
      '24.63%'
    elsif credit_range == '600-660'
      '17.98%'
    elsif credit_range == '660-720'
      '12.99%'
    elsif credit_range == '720+'
      '7.71%'
    end
  end

end
