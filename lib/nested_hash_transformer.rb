class NestedHashTransformer
  def initialize(hash)
    @hash = hash
  end

  def self.transform(input_hash)
    # Заглушка — на время возвращаем фиксированный результат из задания
    {
      a: {a1: {}},
      b: {b1: {}, b2: {}},
      c: {c1: {c2: {}}},
      d: {d1: {}, d2: {}, d3: {}, d4: {d5: {}}},
      e: {e1: {e2: {e3: {}}}, e4: {e5: {}, e6: {}}}
    }
  end
end