require 'rspec'
require_relative '../solver'

describe Solver do
  before :all do
    @solver = Solver.new
  end

  describe '#factorial' do
    context 'when given a positive integer' do
      it 'returns factorial of the number' do
        expect(@solver.factorial(0)).to eq(1)
        expect(@solver.factorial(3)).to eq(6)
        expect(@solver.factorial(5)).to eq(120)
      end
    end

    context 'when given a negative integer' do
      it 'raises an exception' do
        expect(@solver.factorial(-1)).to raise_error(ArgumentError, 'Negative number')
      end
    end

    context 'when given a non-integer' do
      it 'raises an exception' do
        expect(@solver.factorial(nil)).to raise_error(ArgumentError, 'Invalid argument')
        expect(@solver.factorial('str')).to raise_error(ArgumentError, 'Invalid argument')
        expect(@solver.factorial(3.14)).to raise_error(ArgumentError, 'Invalid argument')
      end
    end
  end

  describe '#reverse' do
    context 'when given a string' do
      it 'returns a reversed string' do
        expect(@solver.reverse('Dico')).to eq('ociD')
        expect(@solver.reverse('Rashed')).to eq('dehsaR')
        expect(@solver.reverse('Jhin')).to eq('nihJ')
      end
    end

    context 'when given a non-string' do
      it 'raises an exception' do
        expect(@solver.reverse(nil)).to raise_error(ArgumentError, 'Invalid argument')
        expect(@solver.reverse(3.14)).to raise_error(ArgumentError, 'Invalid argument')
        expect(@solver.reverse([])).to raise_error(ArgumentError, 'Invalid argument')
      end
    end
  end

  describe '#fizzbuzz' do
    context 'when divisible by 3' do
      it 'returns fizz' do
        expect(@solver.fizzbuzz(3)).to eq('fizz')
        expect(@solver.fizzbuzz(6)).to eq('fizz')
        expect(@solver.fizzbuzz(9)).to eq('fizz')
      end
    end
    context 'when divisible by 5' do
      it 'returns buzz' do
        expect(@solver.fizzbuzz(5)).to eq('buzz')
        expect(@solver.fizzbuzz(10)).to eq('buzz')
        expect(@solver.fizzbuzz(20)).to eq('buzz')
      end
    end
    context 'when divisible by 3 and 5' do
      it 'returns fizzbuzz' do
        expect(@solver.fizzbuzz(15)).to eq('fizzbuzz')
        expect(@solver.fizzbuzz(30)).to eq('fizzbuzz')
        expect(@solver.fizzbuzz(45)).to eq('fizzbuzz')
      end
    end
    context 'when not divisible by 3 and not divisble by 5' do
      it 'returns argument as string' do
        expect(@solver.fizzbuzz(7)).to eq('7')
        expect(@solver.fizzbuzz(11)).to eq('11')
        expect(@solver.fizzbuzz(23)).to eq('23')
      end
    end
  end
end
