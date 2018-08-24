class Map

  def initialize(relationship="maps to")
    @pairs = Array.new
    @relationship = relationship
  end

  def set(key, value)
    if @pairs.none? {|pair| pair[0] == key}
      @pairs << [key, value]
    else
      @pairs.each {|pair| pair[1] = value if pair[0] == key}
    end
  end

  def get(key)
    return "Key not found" if @pairs.none? {|pair| pair[0] == key}
    @pairs.each {|pair| return "#{pair[0]} #{@relationship} #{pair[1]}" if pair[0] == key}
  end

  def delete(key)
    return "Key not found" if @pairs.none? {|pair| pair[0] == key}
    @pairs.each_with_index {|pair, i| @pairs.delete_at(i) if pair[0] == key}
  end

  def show
    puts "Displaying all items in the map"
    if @pairs.empty?
      puts "Map is empty."
    else
      @pairs.each {|k, v| puts "#{k} #{@relationship} #{v}"}
   end
  end
end
