# Now let's write a Queue class
# s. We will need the following instance methods: enqueue(el), dequeue, and peek.
class Queue

    attr_accessor :data

    def initialize
        @data = []
    end

    def enqueue(el)
        @data << el
    end

    def dequeue
        @data.shift
    end

    def peek
        if @data.length == 0
            return "Queue is empty"
        else
            return @data.first
        end
    end

end