# class Java::Lang::String
#   def +(string)
#     self.concat(string)
#   end
# end

class String
  def plus(string)
    this_string = Java::Lang::String.new(self)
    this_string.concat(string)
  end
end
