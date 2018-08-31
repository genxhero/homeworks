class LRUCache
   def initialize(max)
     @cache = []
     @max = max
     @most_recent = nil
   end

   def count
     @cache.length
   end

   def add(thing)
    @cache.delete(thing) if @cache.include?(thing)
    @cache << thing
    @most_recent = thing
    @cache.shift if @cache.length > @max    
   end

   def show
    puts @cache.inspect
   end


   private


 end
