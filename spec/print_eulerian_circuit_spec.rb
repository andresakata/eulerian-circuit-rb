require_relative '../undirected_graph'
require_relative '../print_eulerian_circuit'

RSpec.describe UndirectedGraph do
  let(:graph) { UndirectedGraph.new }

  describe '#print' do
    subject do
      expect(graph.has_eulerian_circuit?).to eq(true)
      PrintEulerianCircuit.new(graph).print(graph.nodes.first[0])
    end

    it 'prints circuit' do
      graph.add_node('a')
      graph.add_node('b')
      graph.add_node('c')
      graph.add_node('d')
      graph.add_node('e')
      graph.add_edge('a', 'b')
      graph.add_edge('a', 'c')
      graph.add_edge('b', 'c')
      graph.add_edge('c', 'd')
      graph.add_edge('c', 'e')
      graph.add_edge('d', 'e')
      path = subject
      expect(path.size).to eq(6)
      expect(path[0][0]).to eq('a')
      expect(path[5][1]).to eq('a')
    end

    it 'prints circuit' do
      graph.add_node('a')
      graph.add_node('b')
      graph.add_edge('a', 'b')
      graph.add_edge('b', 'a')
      path = subject
      expect(path.size).to eq(2)
      expect(path[0][0]).to eq('a')
      expect(path[1][1]).to eq('a')
    end

    it 'prints circuit' do
      graph.add_node('a')
      graph.add_node('b')
      graph.add_node('c')
      graph.add_edge('a', 'b')
      graph.add_edge('b', 'c')
      graph.add_edge('c', 'a')
      path = subject
      expect(path.size).to eq(3)
      expect(path[0][0]).to eq('a')
      expect(path[2][1]).to eq('a')
    end

    it 'prints circuit' do
      graph.add_node('a')
      graph.add_node('b')
      graph.add_node('c')
      graph.add_edge('b', 'a')
      graph.add_edge('b', 'c')
      graph.add_edge('a', 'b')
      graph.add_edge('a', 'c')
      graph.add_edge('c', 'b')
      graph.add_edge('c', 'a')
      path = subject
      expect(path.size).to eq(6)
      expect(path[0][0]).to eq('a')
      expect(path[5][1]).to eq('a')
    end
  end
end
