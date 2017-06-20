class Semester < ApplicationRecord

  def which_week
    current_date = Date.today
    semester_start = self.start
    semester_end = self.end

    holidays_start = self.holidays_start
    holidays_end = self.holidays.end


    return 0 if (holidays_start..holidays_end).to_a.include?(current_date)




    end



  end

  def generate_date_range(start, end)
    date_range = (start..end)
  end

  def set_week

  end
end
