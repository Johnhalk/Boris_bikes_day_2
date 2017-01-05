require 'dockingstation'
require 'bike'

describe DockingStation do
  it { is_expected.to respond_to(:release_bike) }
  it { is_expected.to respond_to(:dock).with(1).argument}
     
  describe "release_bike" do
    it "returns a working bike" do
      expect(subject.release_bike.working?).to eql(true)
    end

    before do
      subject.dock(@bike)
      subject.release_bike
    end
    it "fails to return a bike when none are available" do

    end
  end

  describe "docked_bike" do
    before do
      @bike = Bike.new
      subject.dock(@bike)
    end
   
    it "returns the docked bike" do
      expect(subject.docked).to eql(@bike)
    end
  end
end

