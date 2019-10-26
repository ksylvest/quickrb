require 'spec_helper'

RSpec.describe QuickRB::Context do
  subject(:context) { described_class.new }

  describe '#eval' do
    it 'raises an "ArgumentError" when called without arguments' do
      expect { context.eval }.to raise_error(
        ArgumentError,
        'wrong number of arguments (given 0, expected 1..2)'
      )
    end

    it 'raises an "ArgumentError" when supplied invalid number of arguments' do
      expect { context.eval('2 + 3', 'math.js', 'other') }.to raise_error(
        ArgumentError,
        'wrong number of arguments (given 3, expected 1..2)'
      )
    end

    it 'raises an "TypeError" when supplied an invalid "input"' do
      expect { context.eval(2 + 3, 'math.js') }.to raise_error(
        TypeError,
        'wrong argument type Integer (expected String)'
      )
    end

    it 'raises an "TypeError" when supplied an invalid "filename"' do
      expect { context.eval('2 + 3', 0) }.to raise_error(
        TypeError,
        'wrong argument type Integer (expected String)'
      )
    end

    it 'does not raise when supplied "input" and "filename"' do
      expect { context.eval('2 + 3', 'math.js') }.not_to raise_error
    end

    it { expect(context.eval('2')).to be(2) }
    it { expect(context.eval('3.4')).to be(3.4) }
    it { expect(context.eval('"Greetings!"')).to be('Greetings!') }
    it { expect(context.eval('null')).to be_nil }
    it { expect(context.eval('undefined')).to be_nil }
  end
end
