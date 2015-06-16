require 'spec_helper'

describe Level do

  let(:world) { World.new }
  let(:level) { world.levels.first }
  
  describe '#rooms' do
    subject { level.rooms }

    it { should_not be_nil }

    it 'should contain at least one room' do
      expect(subject.first).to be_a Room
    end

  end

end

