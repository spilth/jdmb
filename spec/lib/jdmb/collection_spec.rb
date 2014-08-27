require 'spec_helper'

module JDMB
  describe Collection do
    describe ".initialize" do
      it "lets me specifiy specify ranges of progs and individual progs" do
          collection = Collection.new(
            name: "Mega Collection",
            progs: "513,613,800-803"
          )

          expect(collection.includes_prog?(513)).to be true
          expect(collection.includes_prog?(514)).to be false
          expect(collection.includes_prog?(613)).to be true
          expect(collection.includes_prog?(799)).to be false
          expect(collection.includes_prog?(800)).to be true
          expect(collection.includes_prog?(801)).to be true
          expect(collection.includes_prog?(803)).to be true
          expect(collection.includes_prog?(804)).to be false
      end
    end

    describe "#includes_prog?" do
      context "when a collection includes a prog" do
        it "returns true" do
          collection = Collection.new(name: "Judge Dredd: The Complete Case Files 01", progs: "2-60")

          expect(collection.includes_prog?(2)).to be true
        end
      end

      context "when a collection does not include a prog" do
        it "returns false" do
          collection = Collection.new(name: "Judge Dredd: The Complete Case Files 01", progs: "2-60")

          expect(collection.includes_prog?(61)).to be false
        end
      end
    end
  end
end
