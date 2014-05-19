class Parser

  attr_accessor :parsed_list

  def parse(array)
    self.parsed_list = array.map {|file| {name: file["name"], ext: file["extension"], size: file["size"]} }
  end



end
