require 'bike'

describe Bike.new do
  it { is_expected.to respond_to(:working?) }
end
