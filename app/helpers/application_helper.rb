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
      '25.99%'
    elsif credit_range == '600-660'
      '16.29%'
    elsif credit_range == '660-720'
      '12.99%'
    elsif credit_range == '720+'
      '7.12%'
    end
  end


end
