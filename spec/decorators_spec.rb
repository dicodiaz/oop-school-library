require 'rspec'
require_relative '../decorators'

describe 'Decorators' do
  before :each do
    @nameable = double('nameable')
    allow(@nameable).to receive(:correct_name) { 'peter parker' }
  end

  context CapitalizeDecorator do
    before :each do
      @capitalize_decorator = CapitalizeDecorator.new(@nameable)
    end

    it 'should be a subclass of BaseDecorator' do
      expect(@capitalize_decorator.is_a?(BaseDecorator)).to be(true)
    end

    it 'should run capitalize_decorator.nameable.correct_name and then capitalize it' do
      capitalized_correct_name = @capitalize_decorator.correct_name
      expect(capitalized_correct_name).to eq('Peter parker')
    end
  end

  context TrimmerDecorator do
    before :each do
      @trimmer_decorator = TrimmerDecorator.new(@nameable)
    end

    it 'should be a subclass of BaseDecorator' do
      expect(@trimmer_decorator.is_a?(BaseDecorator)).to be(true)
    end

    it 'should run trimmer_decorator.nameable.correct_name and then capitalize it' do
      trimmed_correct_name = @trimmer_decorator.correct_name
      expect(trimmed_correct_name).to eq('peter park')
    end
  end

  context 'chainability' do
    it 'should allow several decorators to be chained' do
      capitalize_decorator = CapitalizeDecorator.new(@nameable)
      trimmer_capitalize_decorator = TrimmerDecorator.new(capitalize_decorator)
      trimmed_capitalized_name = trimmer_capitalize_decorator.correct_name
      expect(trimmed_capitalized_name).to eq('Peter park')
    end
  end
end
