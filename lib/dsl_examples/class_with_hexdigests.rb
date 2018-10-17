module DslExamples
  class ClassWithHexDigests
    extend Hexdigest

    attr_reader :first_name,
                :last_name

    hexdigest_for :first_name, Digest::MD5
    hexdigest_for :last_name,  Digest::SHA2

    def initialize(first_name, last_name)
      @first_name = first_name
      @last_name = last_name
    end

    def self.test
      cwh = new('Serhii', 'Vernydub')

      puts [cwh.first_name, cwh.first_name_hexdigest].join("\t\t- ")

      puts [cwh.last_name, cwh.last_name_hexdigest].join("\t- ")
    end
  end
end