require "LRU_cache"

describe "LRU Cache" do
  subject(:my_cache) { LRUCache.new(4) }
  describe "#initialize" do
    it "sets the size" do
      expect(my_cache.size).to eq(4)
    end

    it "starts with an empty array" do
      expect(my_cache.cache).to be_empty
    end
  end

  describe "#count" do
    it "returns the amount of elements in the cache" do
      my_cache.add("I walk the line")
      my_cache.add(5)
      expect(my_cache.count).to eq(2)
    end
  end

  describe "#add" do
    it "adds the elements to the end of cache" do
      my_cache.add("I walk the line")
      my_cache.add(5)
      expect(my_cache.cache).to eq(["I walk the line", 5])
    end

    it "removes element from the end while adding new ones if its full" do
      my_cache.add([1,2,3])
      my_cache.add(5)
      my_cache.add(-5)
      my_cache.add({a: 1, b: 2, c: 3})
      my_cache.add([1,2,3,4])
      my_cache.add("I walk the line")
      my_cache.add(:ring_of_fire)
      my_cache.add("I walk the line")
      my_cache.add({a: 1, b: 2, c: 3})
      expect(my_cache.cache).to include([1, 2, 3, 4])
      expect(my_cache.cache).to include(:ring_of_fire)
      expect(my_cache.cache).to include("I walk the line")
      expect(my_cache.cache).to include({:a=>1, :b=>2, :c=>3})
    end
  end

  describe "#show" do
    it "shows the cache in LRU order" do
      my_cache.add([1,2,3,4])
      my_cache.add("I walk the line")
      my_cache.add(:ring_of_fire)
      my_cache.add("I walk the line")
      my_cache.add({a: 1, b: 2, c: 3})
      expect(my_cache.show).to eq([[1, 2, 3, 4], :ring_of_fire,\
                                  "I walk the line",\
                                  {:a=>1, :b=>2, :c=>3 }])
    end
  end

end
