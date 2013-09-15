class Node 
	 attr_accessor :next, :data, :prev
	
	def initialize(n, d, p)
		@next=n
		@data=d
		@prev=p
	end
end

class Linked_List

	def initialize
		 @@top=nil
	end

	def insert(node) 
		if @@top.nil?
			@@top=node
		else

			@current=Node.new(nil,nil,nil)
			@current=@@top
		
			while @current.next!=nil do
				@current=@current.next
			end

			@current.next = node
		end
	end

	def printList
		node=@@top
		print node.data
		while !node.next.nil? do
			node=node.next
			print node.data
		end
	end
end

ll=Linked_List.new
ll.insert(Node.new(nil,"<-1->",nil))
ll.insert(Node.new(nil,"<-2->",nil))
ll.insert(Node.new(nil,"<-3->",nil))
ll.insert(Node.new(nil,"<-4->",nil))
ll.insert(Node.new(nil,"<-5->",nil))
ll.printList
