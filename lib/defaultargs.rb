module DefaultArgs

  def todays_date
    Date.today.strftime"%d%m%y"
  end

  def make_key
    rand(99999).to_s.rjust(5, "0")
  end
end
