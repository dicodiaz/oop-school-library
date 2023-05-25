require 'rspec'
require_relative '../base_decorator'

describe BaseDecorator do
  before :each do
    @nameable = double('nameable')
    allow(@nameable).to receive(:name) { 'Peter Parker' }
    allow(@nameable).to receive(:correct_name) { 'Corrected Peter Parker' }
    @base_decorator = BaseDecorator.new(@nameable)
  end

  context 'inheritance' do
    it 'should be a subclass of Nameable' do
      expect(@base_decorator.is_a?(Nameable)).to be(true)
    end
  end

  context '#intialize' do
    it 'should initialize with the given nameable' do
      expect(@base_decorator).to be_an_instance_of(BaseDecorator)
      expect(@base_decorator.nameable).to eq(@nameable)
    end
  end

  context '#correct_name' do
    it 'should execute base_decorator.nameable.correct_name' do
      correct_name = @base_decorator.correct_name
      expect(correct_name).to eq('Corrected Peter Parker')
    end
  end
end
