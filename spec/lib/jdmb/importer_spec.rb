require 'spec_helper'

module JDMB
  describe Importer do
    describe "#import" do
      it "returns an array of collections" do
        yaml = <<DATA
-
  title: 'Foo'
  progs: '2-60'
-
  title: 'Bar'
  progs: '61-65'
DATA
        collections = Importer.import(yaml)

        expect(collections.size).to be 2
        expect(collections[0].includes_prog?(5)).to be true
        expect(collections[1].includes_prog?(66)).to be false
      end
    end
  end
end
