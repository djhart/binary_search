class Node
	attr_accessor :parent, :lchild, :rchild

	def initialize(value, parent)
		@value = value
		@parent = parent
	end

end


def build_tree(arr)
	shuffed = arr.shuffle 
	center = Node.new(shuffed[0], "none")
	tree = [] 
	tree << center


end