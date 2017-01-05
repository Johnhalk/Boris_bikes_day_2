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
      expect{subject.release_bike}.to raise_error(StandardError, "No bike available")
    end
  end

  describe "dock" do
    it "store a bike inside a docking station" do
      expect(subject.dock(@bike)).to eql(@bike)
    end
  end

  describe "docked" do
    before do
      @bike = Bike.new
      subject.dock(@bike)
    end

    it "returns the docked bike" do
      expect(subject.docked).to eql(@bike)
    end
  end
end
