require 'spec_helper'

describe Portal do

  let(:room)   { Room.new }
  let(:portal) { Portal.new(destination: room) }
  subject { portal }

  describe '#destination' do
    subject { portal.destination }
    it { should be_a Room }
    it { should eq room }
  end

  describe '#name' do
    subject { portal.name }
    it { should be_a String }
  end

  describe '#description' do
    subject { portal.description }
    it { should be_a String }
  end

end
