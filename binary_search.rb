class Node
	attr_accessor :left, :right, :value, :count

	def initialize(value)
		@value = value
		@count = 1
	end

	def insert(v)
		case value <=> v
		when 1 then insert_left(v)
		when -1 then insert_right(v)
		when 0 then self.count += 1
		end
	end

	def inspect
      "{#{value}::#{left.inspect}|#{right.inspect}}"
    end

    def insert_left(v)
    	if left
    		left.insert(v)
    	else
    		self.left = Node.new(v)
    	end
    end

    def insert_right(v)
    	if right 
    		right.insert(v)
    	else
    		self.right = Node.new(v)
    	end
    end

    def include?(v)
   		case value <=> v
    	when 1 then left.nil? ? false : left.include?(v)
    	when -1 then right.nil? ? false : right.include?(v)
    	when 0 then true
    	end
    end

end


def build_tree(arr)
	shuffed = arr.shuffle 
	center = Node.new(shuffed[0])
	tree = [] 
	tree << center
	shuffed[1..-1].each {|x| tree[0].insert(x)}
	return tree
end

arr = [1,2,3,4,3,4,5,5,45,35,3,2,34,25,6,3,45,34,63,45,3,67,7,4,5,674,74,5,64,567,47,4,56,456,45,64,56,5]

tree = build_tree(arr)
bst = tree[0]


puts bst.include?(15)
puts bst.include?(1)
puts bst.include?(13)
puts bst.include?(5)
puts bst.include?(45)
puts bst.include?(100)
puts bst.include?(4)
puts bst.include?(3)
