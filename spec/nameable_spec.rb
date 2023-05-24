require 'rspec'
require_relative '../nameable'

describe Nameable do
  context 'when the class is Nameable' do
    it 'raises NotImplementedErrr when calling #correct_name' do
      nameable = Nameable.new
      expect { nameable.correct_name }.to raise_error(NotImplementedError)
    end
  end
  context 'when the class is instance of Nameable' do
    it 'returns correct name' do
      mocked_nameable = Nameable.new
      # Mock #correct_name implementation
      allow(mocked_nameable).to receive(:correct_name).and_return('MockedNameable')
      expect(mocked_nameable.correct_name).to eq('MockedNameable')
    end
  end
end
