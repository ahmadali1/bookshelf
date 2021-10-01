class Author < ApplicationRecord
  def full_name
    first_name + ' ' + last_name
  end

  def location
    [rand(90), rand(90)]
  end
end
