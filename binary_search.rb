class Node
	attr_accessor :parent, :lchild, :rchild, :value, :count

	def initialize(value, parent)
		@value = value
		@parent = parent
		@lchild, @rchild = "none"
		@count = 1
	end

end

def descend(x, node, tree)
	if x < node.value
		if node.lchild == "none"
			node.lchild = Node.new(x, node)
			tree << node.lchild
		else 
			y = node.lchild
			puts y
			descend(x, y, tree)
		end
	elsif x > node.value
		if node.rchild == "none"
			node.rchild = Node.new(x, node)
			tree << node.rchild
		else 
			y = node.rchild
			puts y
			descend(x, y, tree)
		end
	else
		node.count += 1
	end
end

def build_tree(arr)
	shuffed = arr.shuffle 
	center = Node.new(shuffed[0], "none")
	tree = [] 
	tree << center
	shuffed[1..-1].each {|x| descend(x, tree[0], tree)}
	return tree
end

arr = [1,2,3]

tree = build_tree(arr)
#tree.each {|tree| print tree; puts tree.count}
puts 