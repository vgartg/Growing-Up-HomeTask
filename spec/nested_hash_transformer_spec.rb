require 'rspec'
require_relative '../lib/nested_hash_transformer'

RSpec.describe NestedHashTransformer do
  describe '.transform' do
    let(:empty_input_hash) { {} }

    let(:input_hash) do
      {
        a: :a1,
        b: [:b1, :b2],
        c: {c1: :c2},
        d: [:d1, [:d2, :d3], {d4: :d5}],
        e: {e1: {e2: :e3}, e4: [:e5, :e6]}
      }
    end

    let(:output_hash) do
      {
        a: {a1: {}},
        b: {b1: {}, b2: {}},
        c: {c1: {c2: {}}},
        d: {d1: {}, d2: {}, d3: {}, d4: {d5: {}}},
        e: {e1: {e2: {e3: {}}}, e4: {e5: {}, e6: {}}}
      }
    end

    it "transform from input hash to output expected hash" do
      expect(NestedHashTransformer.transform(input_hash)).to eq(output_hash)
    end

    it "not transform from empty hash" do
      expect(NestedHashTransformer.transform(empty_input_hash)).to eq({})
    end
  end
end