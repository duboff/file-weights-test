class GravityCalculator

  def factor(file_type)
    self.factor_table[file_type]
  end

  def factor_table
    { song: 1.2,
      video: 1.4,
      document: 1.1,
      binary: 1,
      text: 1,
      other: 1 }
  end

end
