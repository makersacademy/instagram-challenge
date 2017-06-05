module DateTimePresenter
  def print_time_stamp(datetime)
    datetime.strftime('%H:%M')
  end

  def print_date_stamp(datetime)
    datetime.strftime('%d/%m/%Y')
  end

  def local_time_stamp
    print_time_stamp(self.created_at.localtime)
  end

  def local_date_stamp
    print_date_stamp(self.created_at.localtime)
  end
end
