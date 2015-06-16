require 'spec_helper'

describe Portal do

  let(:room)   { Room.new }
  let(:portal) { Portal.new(room) }
  subject { portal }

  describe '#destination' do
    subject { portal.destination }
    it { should be_a Room }
    it { should eq room }
  end

end
