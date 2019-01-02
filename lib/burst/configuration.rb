module Burst
  class Configuration
    attr_accessor :concurrency

    def self.from_json(json)
      new(Burst::JSON.decode(json, symbolize_keys: true))
    end

    def initialize(hash = {})
      self.concurrency = hash.fetch(:concurrency, 5)
    end


    def to_hash
      {
        concurrency: concurrency,
      }
    end

    def to_json
      Burst::JSON.encode(to_hash)
    end
  end
end
