helpers do
  def round_up(num, near = 0.05)
    num % near == 0 ? num : num + near - (num  % near)
  end

  def total_gravity(files, type, calc)
    files.inject(0) {|res, file| res + calc.gravity(file, type)}
  end
end
