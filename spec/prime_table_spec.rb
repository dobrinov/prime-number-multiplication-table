require 'spec_helper'

describe PrimeTable do

  let(:prime_table) { PrimeTable.new(10,10) }

  describe "#generate_multiplication_table" do

    let(:table) { prime_table.generate_multiplication_table }

    it "returns two dimensional Array" do
      expect(table).to be_a(Array)

      table.each { |row| expect(row).to be_a(Array) }
    end

    it "has correct cell values" do
      table.each_with_index do |row, i|
        row.each_with_index do |product, j|
          expect(product).to eq(Prime.at(i) * Prime.at(j))
        end
      end
    end
  end
end
