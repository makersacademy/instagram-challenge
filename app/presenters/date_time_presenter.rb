module DateTimePresenter

  def print_time_stamp(datetime)
    datetime.strftime('%H:%M')
  end

  def print_date_stamp(datetime)
    datetime.strftime('%d/%m/%Y')
  end

end
