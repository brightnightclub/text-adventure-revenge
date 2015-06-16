require 'spec_helper'



describe Room do

  let(:room) { Room.new(name: 'A room', description: 'about like you would expect') }

  subject { room }

  describe '#portals' do
    subject { room.portals }

    it { should_not be_nil }

    context 'given a room with a recursive portal' do
      before { room.portals << Portal.new(destination: room) }

      it 'should return the portal' do
        expect(room.portals.first).to be_a Portal
      end
    end

  end

end
