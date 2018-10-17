module DslExamples
  module Hexdigest
    def hexdigest_for(method, algorithm)
      unless algorithm.respond_to?(:hexdigest)
        raise 'algorithm must respond to method #hexdigest'
      end

      define_method "#{method}_hexdigest" do
       algorithm.hexdigest(send(method))
      end
    end
  end
end