class Node
	attr_accessor :parent, :lchild, :rchild, :value

	def initialize(value, parent)
		@value = value
		@parent = parent
		@lchild, @rchild = "none"
	end

end


def build_tree(arr)
	shuffed = arr.shuffle 
	center = Node.new(shuffed[0], "none")
	tree = [] 
	tree << center
	shuffed.each do |x|
		if x < tree[0].value
			if tree[0].lchild == "none"
				tree[0].lchild = Node.new(x, tree[0])
				tree << tree[0].lchild
			end
		else
			if tree[0].rchild == "none"
				tree[0].rchild = Node.new(x, tree[0])
				tree <<tree[0].rchild
			end
		end
	end
	return tree
end

arr = [1,2,3]

tree = build_tree(arr)
print tree