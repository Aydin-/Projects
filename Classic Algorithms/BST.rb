# Solution by Aydin Gungordu - www.aydingungordu.com

class BSTnode
	attr_accessor :data, :left, :right

	def isLeaf?
		@left.nil? && @right.nil?
	end

	def initialize(new_data)
		@data=new_data
		@left=nil
		@right=nil
	end

end

class BST
	#attr_accessor :root
	def initialize(root)
		@@root=root
	end

	 def insert(new_node)
        puts "Inserting :" + new_node.data.to_s
        current_node = @@root

        while nil != current_node
            if new_node.data < current_node.data && current_node.left.nil?
                current_node.left = new_node
            elsif  new_node.data > current_node.data && current_node.right.nil?
                current_node.right = new_node
            elsif new_node.data < current_node.data
                current_node = current_node.left
            elsif new_node.data > current_node.data
                current_node = current_node.right
            else
                return
            end
        end
    end

	def print_in_order(node)
		  if node.nil? 
		  	puts " "
		  	return
		  end
		
		  print_in_order(node.left)
		  print node.data
		  print_in_order(node.right)
		  
	end

end

root=BSTnode.new(1)
bst=BST.new(root)
bst.print_in_order(root)
bst.insert(BSTnode.new(-1))
bst.print_in_order(root)
bst.insert(BSTnode.new(0))
bst.print_in_order(root)
bst.insert(BSTnode.new(4))
bst.print_in_order(root)
