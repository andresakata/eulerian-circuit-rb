require_relative '../undirected_graph'

RSpec.describe UndirectedGraph do
  let(:graph) { UndirectedGraph.new }

  describe '#connected?' do
    subject { graph.connected? }

    context 'when graph is empty' do
      it 'returns true' do
        expect(subject).to eq(true)
      end
    end

    context 'when graph has only one node' do
      before do
        graph.add_node(1)
      end

      it 'returns true' do
        expect(subject).to eq(true)
      end
    end

    context 'when graph is not connected' do
      before do
        graph.add_node(1)
        graph.add_node(2)
      end

      it 'returns false' do
        expect(subject).to eq(false)
      end
    end

    context 'when graph is connected' do
      before do
        graph.add_node(1)
        graph.add_node(2)
        graph.add_edge(1, 2)
      end

      it 'returns true' do
        expect(subject).to eq(true)
      end
    end
  end

  describe '#has_eulerian_circuit?' do
    subject { graph.has_eulerian_circuit? }

    context 'when graph is not connected' do
      before do
        graph.add_node(1)
        graph.add_node(2)
      end

      it 'returns false' do
        expect(subject).to eq(false)
      end
    end

    context 'when graph has odd degree node' do
      before do
        graph.add_node(1)
        graph.add_node(2)
        graph.add_edge(1, 2)
      end

      it 'returns false' do
        expect(subject).to eq(false)
      end
    end

    context 'when graph is connected and has all even degree nodes' do
      before do
        graph.add_node(1)
        graph.add_node(2)
        graph.add_edge(1, 2)
        graph.add_edge(1, 2)
      end

      it 'returns true' do
        expect(subject).to eq(true)
      end
    end
  end
end
