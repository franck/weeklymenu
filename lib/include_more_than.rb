module Enumerable
  def include_more_than?(value, duplicates_number=0)
    return false if duplicates_number.nil?
    counter = Hash.new(0)
    self.each do |v|
      counter[v] += 1
      return true if counter[value] > (duplicates_number)
    end
    return false
  end
end
