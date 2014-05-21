module RoundHelpers

  def roundup(num, near = 0.05)
    (num % near == 0 ? num : num + near - (num  % near)).round(2)
  end

end
