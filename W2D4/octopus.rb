require_relative "sorting.rb"


def sluggish_octopus(arr)
  result = arr.bubble_sort { |x, y| x.length <=> y.length }
  puts result.inspect
  result.last
end

def dominant_octopus(arr) #
  result = arr.merge_sort { |x, y| x.length <=> y.length }
  puts result.inspect
  result.last
end

def clever_octopus(arr) #Linear search for longest
  biggest = ""
  arr.each do |el|
    biggest = el if el.length > biggest.length
  end
  biggest
end

def slow_dance(direction, array)
  array.each_with_index do |el, idx|
   return "To go #{direction}, the slow-dancing octopus must use tentacle \##{idx}" if el == direction
 end
   return "WORST CASE SCENARIO! The octopus can't go #{direction} at all!"
end

def fast_dance(direction, hash)
  return "WORST CASE SCENARIO! The octopus can't go #{direction} at all!" if hash.has_key?(direction) == false
  "To go #{direction}, the fast-dancing octopus must use tentacle \##{hash[direction]}"
end

fish = ["fish", "fiiish", "fiiiiish", "fiiiish", "fffish", "ffiiiiisshh",
       "fsh", "fiiiissshhhhhh"]
tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down",
        "left",  "left-up" ]
tiles_hash = {"up"=>0,  "right-up"=>1, "right"=>2, "right-down"=>3, "down"=>4, "left-down"=>5,
        "left"=>6,  "left-up"=>7}

  start = Time.now
  puts "The sluggish octopus found #{sluggish_octopus(fish)}"
  finish = Time.now
  puts "it took #{finish - start.to_f}"

  start = Time.now
  puts "The dominant octopus found #{dominant_octopus(fish)}"
  finish = Time.now
  puts "it took #{finish - start.to_f}"

  start = Time.now
  puts "The clever octopus found #{clever_octopus(fish)}"
  finish = Time.now
  puts "it took #{finish - start.to_f}"

  puts slow_dance("up", tiles_array)
  puts slow_dance("right-down", tiles_array)
 puts slow_dance("interdimensionally", tiles_array)

  puts fast_dance("up", tiles_hash)
  puts fast_dance("right-down", tiles_hash)
 puts fast_dance("inside-out", tiles_hash)
