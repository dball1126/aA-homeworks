 class LRUCache

    attr_reader :size
    attr_accessor :lru_cache
    

    def initialize((size))
        @size = size
        @lru_cache = Array.new(size)

    end

    def count
      lru_cache.count
    end

    def add(el)
        if lru_cache[0] == nil
            self.lru_cache.rotate!
            self.lru_cache[-1] = el
            
        elsif lru_cache.include?(el)
            el_idx = lru_cache.index(el)
            if lru_cache[-1] == el  
                #do nothing
            else
    self.lru_cache[el_idx], self[-1] = self[-1], self.lru_cache[el_idx]
                
            end
        elsif !lru_cache.include?(el)
                self.lru_cache.rotate!
                self.lru_cache[-1] = el
        end
      # adds element to cache according to LRU principle
    end

    def show
      # shows the items in the cache, with the LRU item first
      p lru_cache
    end

    private
    # helper methods go here!

  end