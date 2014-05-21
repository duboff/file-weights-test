helpers do
  #   require 'linguistics'

  #   def pluralize(word)
  #     Linguistics.use :en
  #     word.en.plural
  #   end
  def round_up(num, near = 0.05)
    num % near == 0 ? num : num + near - (num  % near)
  end
end
