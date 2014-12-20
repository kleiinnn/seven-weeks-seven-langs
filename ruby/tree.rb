class Tree
	attr_accessor :children, :node_name
	
	def initialize(tree)
		@node_name = tree.keys[0]
		@children = [ ]
		tree[tree.keys[0]].each do |child_name, child_children|
			@children.push(Tree.new({child_name => child_children}))
		end
	end

	def visit_all(&block)
		visit &block
		children.each {|child| child.visit_all &block}
	end

	def visit(&block)
		block.call self
	end
end

Tree.new({"grandpa" => {"dad" => {"child1" => { }, "child2" => { }}, "uncle" => {"child3" => {}, "child4" => {}}}}).visit_all do |node|
	puts node.node_name
end
