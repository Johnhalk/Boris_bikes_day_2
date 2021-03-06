require 'dockingstation'
require 'bike'


describe DockingStation do
  subject {described_class.new(20)}
#Everytime a new subject is created it is passed the argument 20
#in order to set the default bike capacity
  it { is_expected.to respond_to(:release_bike) }
  it { is_expected.to respond_to(:dock).with(1).argument}

  describe "release_bike" do
    before do
      @bike = Bike.new
      subject.dock(@bike)
    end
    it "returns a working bike" do
      expect(subject.release_bike.working?).to eql(true)
    end
    it "fails to return a bike when none are available" do
      subject.release_bike
      expect{subject.release_bike}.to raise_error(StandardError, "No bike available")
    end
  end

  describe "dock" do
    before do
      @bike = Bike.new
    end
    it "store a bike inside a docking station" do
      expect(subject.dock(@bike)).to eql([@bike])
    end
    it "doesn't dock more bikes than capacity" do
      DockingStation::DEFAULT_CAPACITY.times {subject.dock(Bike.new)}
      expect{subject.dock(@bike)}.to raise_error(StandardError, "No space available")
    end
  end

  describe "bikes" do
    before do
      @bike1 = Bike.new
      @bike2 = Bike.new
      subject.dock(@bike1)
      subject.dock(@bike2)
    end
    it "returns the list of the docked bikes" do
      expect(subject.bikes).to eql([@bike1, @bike2])
    end
  end

  describe "set capacity" do
      it "allows us to set the bike capacity on initialization" do
      station = DockingStation.new(30)
      expect(station.capacity).to eql (30)
    end
    it "sets the default capacity if no arguments are given" do
      station = DockingStation.new
      expect(station.capacity).to eql (20)
    end
  end

end
