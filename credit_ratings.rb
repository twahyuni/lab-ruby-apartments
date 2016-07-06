def cal_credit_rating credit_score
  # has a credit rating, calculated from the credit score as follows:
  # 760 or higher is "excellent"
  # 725 or higher is "great"
  # 660 or higher is "good"
  # 560 or higher is "mediocre"
  # anything lower is "bad"
  case credit_score
    when 0..559 then :bad
    when 560..659 then :mediocre
    when 660..724 then :good
    when 725..759 then :great
    else :excellent
  end
end
