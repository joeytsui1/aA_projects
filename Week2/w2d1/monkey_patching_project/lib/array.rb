# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    return nil if self.length == 0

    self.max - self.min
  end

  def average
    return nil if self.length == 0

    self.sum / self.length.to_f
  end

  def median
    return nil if self.length == 0

    med = self.length/2

    if self.length.even?
        (self.sort[med] + self.sort[med-1]) /2.0
    else
        self.sort[med]
    end
  end
  
  def counts 
    hash = Hash.new(0)

    self.each do |ele|
        hash[ele] += 1
    end
    return hash
  end

  def my_count(val)
    count = 0
    self.each do |ele|
        if val == ele
            count += 1
        end
    end
    return count
  end

  def my_index (val)
    self.each_with_index do |ele, i|
        if val == ele
            return i
        end
    end
    return nil
  end

  def my_uniq 
    arr = []
    self.each do |ele|
        if !arr.include?(ele)
            arr << ele
        end
    end
    return arr
  end

  def my_transpose
    outer_arr = []

    self.each_with_index do |ele1,i|
        inner_arr = []
        self[i].each_with_index do |ele2, j|
            inner_arr << self[j][i]
        end
        outer_arr << inner_arr
    end
    return outer_arr
  end
end
