require 'spec_helper'

describe Player do

  let(:world)   { World.new }
  let(:player)  { world.player }
  let(:portal ) { player.location.portals.first }
  
  describe '#location' do
    subject { player.location }
    it { should be_a Room }
  end

  describe '#enter_portal' do
    it "should change the player's location to the portal's destination" do
      dest = portal.destination
      player.enter_portal(portal)
      expect(player.location).to eq dest
    end
  end

end

