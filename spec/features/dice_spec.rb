require_relative '../../dice'

RSpec.describe 'Dice', type: :request do
  params = { dices: 4, sides: [1, 2, 3, 4] }
  dice = Dice.new(params)

  describe 'initialization' do
    it 'should have the dices key param' do
      expect(params.has_key?(:dices)).to be_truthy
    end

    it 'should have the sides key param' do
      expect(params.has_key?(:sides)).to be_truthy
    end
  end

  it 'should generate a random number' do
    allow(Kernel).to receive(:rand).and_return(4)
  end

  describe 'calculate' do
    calculate = dice.send(:calculate)
    result = calculate.first

    it 'should genereate an array of results' do
      expect(calculate).to be_an_instance_of(Array)
    end

    it 'a result should include a dice key' do
      expect(result.has_key?(:dice)).to be_truthy
    end

    it 'a result should include a sides key' do
      expect(result.has_key?(:sides)).to be_truthy
    end
    it 'a result should include a result key' do
      expect(result.has_key?(:result)).to be_truthy
    end
  end
end
