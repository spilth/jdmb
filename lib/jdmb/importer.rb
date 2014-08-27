require 'yaml'
module JDMB
  class Importer
    def self.import(yaml)
      books = []

      data = YAML.load(yaml)
      data.each do |stuff|
        books << Collection.new(
          name: stuff["title"],
          progs: stuff["progs"]
        )
      end

      books
    end
  end
end
