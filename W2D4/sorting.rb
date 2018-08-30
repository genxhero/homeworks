
    class Array
      def my_quick_sort(&prc)
        prc ||= proc {|a, b| a<=>b}
        return self if size < 2
        pivot = first
        left = self[1..-1].select{|el| prc.call(el, pivot) == -1}
        right = self[1..-1].select{|el| prc.call(el, pivot) != -1}
        left.my_quick_sort(&prc) + [pivot] + right.my_quick_sort(&prc)
      end

      def bubble_sort!(&prc)
        prc ||= Proc.new {|x, y| x <=> y}
        sorted = false
        until sorted == true
          sorted = true
          (0...self.length-1).each do |i|
            if prc.call(self[i], self[i+1]) == 1
              self[i], self[i+1] = self[i+1], self[i]
              sorted = false
            end # if statement
          end #do loop
        end #until ssorted
        self
      end

      def bubble_sort(&prc)
        prc ||= Proc.new {|x, y| x <=> y}
        self.dup.bubble_sort!(&prc)
      end

     def slugsort #just`returns the biggest string with as much complexity as possible
       biggest = self[0]
       (1...self.length).each do |i|
         current = self[i]
         biggest = current if biggest.length < current.length
       end
       biggest
     end



     def merge_sort(&prc)
     prc ||= Proc.new { |x, y| x <=> y }

     return self if count <= 1

     midpoint = count / 2
     sorted_left = self.take(midpoint).merge_sort(&prc)
     sorted_right = self.drop(midpoint).merge_sort(&prc)

     Array.merge(sorted_left, sorted_right, &prc)

   end

   private
   def self.merge(left, right, &prc)
     merged = []

     until left.empty? || right.empty?
       case prc.call(left.first, right.first)
       when -1
         merged << left.shift
       when 0
         merged << left.shift
       when 1
         merged << right.shift
       end
     end

     merged.concat(left)
     merged.concat(right)

     merged
   end

  end
