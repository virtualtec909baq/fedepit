class Graph
  attr_accessor :graph
  
  def initialize
    @graph = Hash.new { |hash, key| hash[key] = [] }
  end

  def addEdge(a, b)
    @graph[a] << b
    @graph[b] << a
  end

  def remove_edge(a, b)
    @graph[a] << b
    @graph[b] << a
  end
  
  def searchPath(a, b, result,&bl)
    result = result+[a] 
    bl.call(result) if a == b
    @graph[a].each do |v|
         searchPath(v, b, result,&bl) if ! result.include?(v)
    end
  end
end
