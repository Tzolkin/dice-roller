class Dice
  attr_accessor :dices, :sides, :overall

  def initialize(options)
    @dices = options[:dices]
    @sides = options[:sides]
  end

  def roll
    @overall = 0
    calculate.each do |result|
      @overall += result[:result]
      puts "Dice number #{result[:dice]} with #{result[:sides]} faces result: " + result[:result].to_s
    end
    puts "Overall total of all values: " + @overall.to_s
  end

  private

  def calculate
    results = []
    (1..@dices).each_with_index do |dice, index|
      results << { dice: (index + 1), sides: @sides[index], result: result(@sides[index]) }
    end

    results
  end

  def result(side)
    rand(side) + 1
  end
end
