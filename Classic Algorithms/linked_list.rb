# Solution by Aydin Gungordu - www.aydingungordu.com

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
		 @@head=nil
		 @@tail=nil
	end

	def insert(node) 
		if @@head.nil?
			@@head=node
			@@tail=node
		else
			@current=@@head
		
			while @current.next!=nil do
				@current=@current.next
			end

			@current.next = node
			node.prev=@current
			@@tail=node
		end
	end

	def deleteNode(node)
		if(!node.prev.nil?)
			node.prev.next = node.next
		else
			@@head=node.next
		end
	end

	def printList
		node=@@head
		print node.data
		while !node.next.nil? do
			node=node.next
			print node.data
		end
	end
	def printListBackwards
		node=@@tail
		print node.data
		while !node.prev.nil? do
			node=node.prev
			print node.data
		end
	end
end

ll=Linked_List.new
ll.insert(Node.new(nil,"<-1->",nil))
ll.insert(Node.new(nil,"<-2->",nil))
ll.insert(Node.new(nil,"<-3->",nil))
tempNode=Node.new(nil,"<-4->",nil)
ll.insert(tempNode)
ll.insert(Node.new(nil,"<-5->",nil))
ll.deleteNode(tempNode)
ll.printList
ll.printListBackwards
