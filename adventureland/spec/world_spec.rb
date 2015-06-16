require 'spec_helper'

describe World do

  let(:world) { World.new }
  
  describe '#levels' do
    subject { world.levels }

    it { should_not be_nil }

    it 'should contain at least one level' do
      expect(subject.first).to be_a Level
    end
  end

  it 'should have a singleton getter' do
    expect(World.get).to be_a World
  end

end

