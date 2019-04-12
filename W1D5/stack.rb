class Stack

        attr_accessor :data

        def initialize
            @data = []
            
        end

        def push(el)
            @data.push(el)
        end

        def pop
            @data.pop

        end

        def peek
        if @data.length == 0
                return nil
            else
                return self.data.last
        end
    end
end