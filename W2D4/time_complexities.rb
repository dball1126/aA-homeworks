
 # Bubble Sort: O(n^2)
  def bubble_sort!(array)
    start = Time.now
    len = array.length - 1
    sorted = false

    until sorted
      sorted = true
      (0...len).each do |idx|
        if array[idx] > array[idx + 1]
          array[idx], array[idx + 1] = array[idx + 1], array[idx]
          sorted = false
          puts "pPPPPPPPPPPPPPPPPP"
        end
      end
    end
     finish = Time.now
    
    return array
  end


  # Merge Sort: O(n*lg(n))
  def merge_sort (array, &prc)
    
    #     return array if array.length <= 1

    # prc ||= Proc.new{|a,b| a<=>b }

    return array if array.length <= 1

    mid_idx = array.length / 2
    merge(
      merge_sort(array.take(mid_idx), &prc),
      merge_sort(array.drop(mid_idx), &prc),
      &prc
    )
   
    
    
  end

  # NB: In Ruby, shift is an O(1) operation. This is not true of all languages.
  def merge(left, right, &prc)
    start = Time.now
    merged_array = []
    prc = Proc.new { |num1, num2| num1 <=> num2 } unless block_given?
    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged_array << left.shift
      when 0
        merged_array << left.shift
      when 1
        merged_array << right.shift
      end
    end
     finish = Time.now
    diff = (finish - start)
    puts diff

    
    merged_array + left + right
  end