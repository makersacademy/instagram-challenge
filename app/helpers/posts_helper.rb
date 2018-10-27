require 'time'

module PostsHelper
  SECONDS_IN_A_MINUTE = 60
  SECONDS_IN_A_HOUR = 3600
  SECONDS_IN_A_DAY = 86400
  SECONDS_IN_A_WEEK = 604800
  SECONDS_IN_A_YEAR = 31536000

  attr_reader :time_posted

  def get_time(time_posted)
    @time_posted = time_posted
    relative_time_string
  end

  def relative_time_string
    ('Posted ' + simplest_number.to_s + " #{units_controller}" + "#{plurals} ago")
  end

  private

  def calculator
    (Time.now - @time_posted)
  end

  def units_controller
    return 'second' if calculator < SECONDS_IN_A_MINUTE
    return 'minute' if calculator < SECONDS_IN_A_HOUR
    return 'hour' if calculator < SECONDS_IN_A_DAY
    return 'day' if calculator < SECONDS_IN_A_WEEK
    return 'week' if calculator < SECONDS_IN_A_YEAR
    'year'
  end

  def integer_controller
    return 1 if calculator < SECONDS_IN_A_MINUTE
    return SECONDS_IN_A_MINUTE if calculator < SECONDS_IN_A_HOUR
    return SECONDS_IN_A_HOUR if calculator < SECONDS_IN_A_DAY
    return SECONDS_IN_A_DAY if calculator < SECONDS_IN_A_WEEK
    return SECONDS_IN_A_WEEK if calculator < SECONDS_IN_A_YEAR
    SECONDS_IN_A_YEAR
  end

  def simplest_number
    calculator.to_i / integer_controller
  end

  def plurals
    return '' if simplest_number == 1
    's'
  end

  def test_method
    return "test method run"
  end
end
