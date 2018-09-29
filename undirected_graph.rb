class UndirectedGraph
  attr_reader :nodes

  def initialize
    @nodes = {}
  end

  def add_node(node)
    @nodes[node] = [] unless @nodes.include?(node)
  end

  def remove_node(node)
    @nodes.delete(node)
  end

  def add_edge(node_a, node_b)
    @nodes[node_a] << node_b
    @nodes[node_b] << node_a
  end

  def remove_edge(node_a, node_b)
    @nodes[node_a].slice!(@nodes[node_a].index(node_b))
    @nodes[node_b].slice!(@nodes[node_b].index(node_a))
  end

  def connected?
    return true if @nodes.empty?
    visited_nodes = []
    dfs(@nodes.keys.first, visited_nodes)
    visited_nodes.size == @nodes.size
  end

  def dfs(node, visited_nodes)
    visited_nodes << node
    @nodes[node].each do |adjacent_node|
      unless visited_nodes.include?(adjacent_node)
        dfs(adjacent_node, visited_nodes)
      end
    end
  end

  def has_eulerian_circuit?
    return false unless connected?
    @nodes.each do |node|
      return false if node[1].size.odd?
    end
    true
  end
end
