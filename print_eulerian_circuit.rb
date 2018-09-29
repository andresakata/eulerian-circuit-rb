class PrintEulerianCircuit
  def initialize(graph)
    @graph = graph
  end

  def print(node, path = [])
    @graph.nodes[node].each do |adjacent|
      if valid_adjacent?(node, adjacent)
        puts "#{node}-#{adjacent}"
        path << [node, adjacent]
        @graph.remove_edge(node, adjacent)
        @graph.remove_node(node) if @graph.nodes[node].size == 0
        print(adjacent, path)
        return path
      end
    end
    path
  end

  def valid_adjacent?(node, adjacent)
    return true if @graph.nodes[node].size == 1
    !bridge?(node, adjacent)
  end

  def bridge?(node, adjacent)
    @graph.remove_edge(node, adjacent)
    still_connected = @graph.connected?
    @graph.add_edge(node, adjacent)
    !still_connected
  end
end
