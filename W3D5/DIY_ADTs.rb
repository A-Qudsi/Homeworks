#Exercise 1 
class Stack
    def initialize
        # create ivar to store stack here!
        @ivar = []
    end

    def push(el)
        # adds an element to the stack
        @ivar.push(el)
    end

    def pop
        # removes one element from the stack
        @ivar.pop
    end

    def peek
        # returns, but doesn't remove, the top element in the stack
        @ivar.first
    end
end

#Exercise 2 

class Queue 
    def initialize 
        @ivar = []
    end

    def enqueue(el)
        @ivar.unshift(el)
    end

    def dequeue
        @ivar.shift
    end

    def peek 
        @ivar.first        
    end
end

#Exercise 3 
class Map 
    def initialize
        map_array = []
    end

    def set(key, value)
        includes = false
        map_array.each do |sub_array| 
            if sub_array[0] == key 
                sub_array[1] = value 
                includes = true 
            end
        end
        if includes == false 
            map_array << [key, value]
        end
    end

    def get(key)
        map_array.each {|sub_array| return sub_array[1] if sub_array[0] == key}
    end

    def delete(key)
        map_array.reject! {|sub_array| sub_array[0] == key}
    end

    def show 
        map_array
    end 
end