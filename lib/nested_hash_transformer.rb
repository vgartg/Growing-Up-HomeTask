class NestedHashTransformer
  def initialize(hash)
    @hash = hash
  end

  def self.transform(hash)
    case hash
    when Symbol then { hash => {} }
    when Array then hash.each_with_object({}) { |el, acc| acc.merge!(transform(el)) }
    when Hash then hash.each_with_object({}) { |(key, value), acc| acc[key] = transform(value) }
    else hash
    end
  end
end