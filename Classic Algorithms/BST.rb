# Solution by Aydin Gungordu - www.aydingungordu.com
# Binary Search Tree, with various traversal methods. In order traversal takes block as parameter, can check
# if tree is balanced, or print nodes.

class BSTnode
	attr_accessor :data, :left, :right, :numChildren

	def isLeaf?
		@left.nil? && @right.nil?
	end

	def initialize(new_data)
		@data=new_data
		@left=nil
		@right=nil
		@numChildren=0
	end

end

class BST
	attr_accessor :numChildrenArray

	def initialize(root)
		@@root=root
		@numChildrenArray=Array.new
	end

	 def insert(new_node)
        puts "Inserting :" + new_node.data.to_s
        current_node = @@root

        while nil != current_node
            if new_node.data < current_node.data && current_node.left.nil?
                current_node.left = new_node
                current_node.numChildren += 1
            elsif  new_node.data > current_node.data && current_node.right.nil?
                current_node.right = new_node
                 current_node.numChildren+=1
            elsif new_node.data < current_node.data
                current_node = current_node.left
            elsif new_node.data > current_node.data
                current_node = current_node.right
            else
                return
            end
        end
    end

	def traverse_in_order(node, &action)
		  if node.nil? 
		 	return
		  end
		
		  traverse_in_order(node.left, &action)
		  if action
			 action.call(node)
		  end

		  traverse_in_order(node.right, &action)
		  
	end

	def print_pre_order(node)
		  if node.nil? 
		  	return
		  end
		
		  puts node.data 
		  print_pre_order(node.left)
		  print_pre_order(node.right)  
	end

	def print_post_order(node)
		  if node.nil? 
		  	return
		  end
		
		  print_post_order(node.left)
		  print_post_order(node.right)
		  puts node.data 
		
	end

	
	def isBalanced?
		
		traverse_in_order(@@root) { |node| @numChildrenArray.push(node.numChildren)}
		if numChildrenArray.max > numChildrenArray.min + 1
			return false
		else
			return true
		end
	end
end



root=BSTnode.new(1)
bst=BST.new(root)
r = Random.new

50.times {
	bst.insert(BSTnode.new(r.rand(-100...100)))
}

puts "\nIn order: "
bst.traverse_in_order(root) { |node| puts node.data.to_s}
puts "\nPre order: "
bst.print_pre_order(root)
puts "\nPost order: "
bst.print_post_order(root)
puts " "

if bst.isBalanced?
	puts "This is a balanced tree."
else
	puts "This is not a balanced tree"
end


