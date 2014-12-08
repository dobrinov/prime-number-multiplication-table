require_relative 'prime.rb'

class PrimeTable

  attr_reader :rows,
              :cols

  def initialize(rows, cols)
    @rows = rows
    @cols = cols

    @table = generate_multiplication_table
  end

  def generate_multiplication_table
    table = Array.new(rows)

    (0..rows-1).each do |row|
      table[row] = Array.new(cols)

      (0..cols-1).each do |col|
        table[row][col] = Prime.at(row) * Prime.at(col)
      end
    end

    table
  end

  def to_s
    table = ([''] + (0..cols-1).map { |col| Prime.at(col) }).join("\t") + "\n"

    @table.each_with_index do |row, i|
      table << ([Prime.at(i)] + row.map { |product| product }).join("\t") + "\n"
    end

    table
  end
end
