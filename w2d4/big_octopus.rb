fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def sluggish_longest_fish(fish_arr)
  longest_word = ""
  fish_arr.each_index do |idx1|
    fish_arr.each_index do |idx2|
      next if idx1 == idx2
      word = fish_arr[idx1].length > fish_arr[idx2].length ? \
      fish_arr[idx1] : fish_arr[idx2]
      longest_word = word if word.length > longest_word.length
    end
  end
  longest_word
end

p sluggish_longest_fish(fish)

def dominant_longest_fish(fish_arr)
  return fish_arr.first if fish_arr.length == 1

  midpoint = fish_arr.length / 2

  left = dominant_longest_fish(fish_arr.take(midpoint))
  right = dominant_longest_fish(fish_arr.drop(midpoint))

  left.length > right.length ? left : right
end

p dominant_longest_fish(fish)

def clever_longest_fish(fish_arr)
  longest_word = ""
  fish_arr.each do |word|
    longest_word = word if word.length > longest_word.length
  end
  longest_word
end

p clever_longest_fish(fish)

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(direction, tiles_array)
  tiles_array.each_with_index do |tile, idx|
    return idx if tile == direction
  end
end

p slow_dance("up", tiles_array)
p slow_dance("right-down", tiles_array)

tiles_hash = {
  "up" => 0,
  "right-up" => 1,
  "right" => 2,
  "right-down" => 3,
  "down" => 4,
  "left-down" => 5,
  "left" => 6,
  "left-up" => 7
}
def fast_dance(direction, tiles_hash)
  tiles_hash[direction]
end

p fast_dance("up", tiles_hash)
p fast_dance("right-down", tiles_hash)
