=begin 
Given root node of a directed graph, clone this graph by creating its deep copy such that cloned graph has same vertices and edges as original graph.

Runtime Complexity
Linear, O(n).

Memory Complexity
Logarithmic, O(n). 'n' is number of vertices in graph.

We can have most n entries in hash table, so worst case space complexity is O(n).

We use depth first traversal and create a copy of each node while traversing the graph. To avoid getting stuck in cycles, we'll use a hashtable to store each completed node and will not revisit nodes that exist in the hashtable. Hashtable key will be a node in the original graph, and its value will be the corresponding node in cloned graph.

=end 

class Node_clone
  attr_accessor :data, :neighbors
  def initialize(d)
    @data = d
    @neighbors = []
  end
end

def clone_rec(root, nodes_completed)
  if (!root)
    return nil
  end

  pNew = Node_clone.new(root.data)
  nodes_completed[root.data] = pNew

  root.neighbors.each do |p|
    x = nodes_completed[p.data]
    if (!x)
      pNew.neighbors.push(clone_rec(p, nodes_completed))
    else
      pNew.neighbors.push(x)
    end
  end

  return pNew
end

def clone(root)
  nodes_completed = {}
  return clone_rec(root, nodes_completed)
end