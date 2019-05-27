require_relative './spec_helper'

RSpec.describe "Lyft domain" do
  before :all do

    # Drivers
    @d1 = Driver.new("Steve G")
    @d2 = Driver.new("David S")
    @d3 = Driver.new("Cody G")

    # Passengers
    @p1 = Passenger.new("Ben H")
    @p2 = Passenger.new("Jason B")
    @p3 = Passenger.new("Jessica B")
    @p4 = Passenger.new("Jessica P")

    # Rides
    @r1 = Ride.new(@d1, @p1, 4.2)
    @r2 = Ride.new(@d1, @p3, 3.4)
    @r3 = Ride.new(@d2, @p2, 2.5)
    @r4 = Ride.new(@d2, @p3, 5.6)
    @r5 = Ride.new(@d3, @p4, 1.3)
    @r6 = Ride.new(@d3, @p4, 9.3)
    @r7 = Ride.new(@d1, @p3, 3.3)
    @r8 = Ride.new(@d1, @p3, 3.7)
    @r9 = Ride.new(@d3, @p1, 6.2)
  end

  describe Driver do
    context "day 1 specs" do
      it "has a name" do
        expect(@d1.name).to eq("Steve G")
        expect(@d2.name).to eq("David S")
      end

      it "has an .all method that returns an array of Driver objects" do
        expect(Driver.all).to be_a_kind_of(Array)
        expect(Driver.all.length).to eq(3)
        expect(Driver.all.first).to be_a_kind_of(Driver)
      end

      it "has a #rides method that returns an array of Ride objects" do
        expect(@d1.rides).to be_a_kind_of(Array)
        expect(@d1.rides.length).to eq(4)
        expect(@d1.rides.first).to be_a_kind_of(Ride)
      end

      it "has a #passengers method that returns an array of Passenger objects" do
        expect(@d1.passengers).to be_a_kind_of(Array)
        expect(@d1.passengers.length).to eq(4)
        expect(@d1.passengers.first).to be_a_kind_of(Passenger)
      end
    end

    context "day 2 specs" do
      it ".find_by_name takes a string and returns the first Driver whose name matches the given string" do
        expect(Driver.find_by_name("Cody G")).to eq(@d3)
      end

      it ".mileage_cap takes a number and returns an array of all drivers who have exceeded that mileage" do
        expect(Driver.mileage_cap(15)).to be_a_kind_of(Array)
        expect(Driver.mileage_cap(15)).to include(@d3)
        expect(Driver.mileage_cap(9)).to include(@d1, @d3)
      end

      it "#most_frequent_passenger returns the first passenger wiht the most trips associated with the driver" do
        expect(@d1.most_frequent_passenger).to eq(@p3)
        expect(@d3.most_frequent_passenger).to eq(@p4)
      end

      it "#longest_ride returns the longest ride for the driver" do
        expect(@d2.longest_ride).to eq(@r4)
        expect(@d3.longest_ride).to eq(@r6)

        #expect(@d3.rides).to eq(@r6)

      end
    end
  end

  describe Passenger do
    context "day 1 specs" do
      it "has a name" do
        expect(@p1.name).to eq("Ben H")
        expect(@p2.name).to eq("Jason B")
      end

      it "has an .all method that returns an array of Passenger objects" do
        expect(Passenger.all).to be_a_kind_of(Array)
        expect(Passenger.all.length).to eq(4)
        expect(Passenger.all.first).to be_a_kind_of(Passenger)
      end

      it "has a #rides method that returns an array of Ride objects" do
        expect(@p1.rides).to be_a_kind_of(Array)
        expect(@p1.rides.length).to eq(2)
        expect(@p1.rides.first).to be_a_kind_of(Ride)
      end

      it "has a #drivers method that returns an array of Driver objects" do
        expect(@p1.drivers).to be_a_kind_of(Array)
        expect(@p1.drivers.length).to eq(2)
        expect(@p1.drivers.first).to be_a_kind_of(Driver)
      end
    end

    context "day 2 specs" do
      it "#total_distance returns the total distance travelled by the passenger" do
        expect(@p1.total_distance).to eq(10.4)
        expect(@p2.total_distance).to eq(2.5)
      end

      it ".find_all_by_pattern accepts a string, and returns all Passengers whose name includes the given string" do

        expect(Passenger.find_all_by_pattern("B").length).to be(3)

        expect(Passenger.find_all_by_pattern("Jess")).to include(@p3, @p4)
        expect(Passenger.find_all_by_pattern("essi")).not_to include(@p1, @p2)
      end

      it ".premium_members returns an array of all passengers who have travelled over 15 miles" do
        expect(Passenger.premium_members).to be_a_kind_of(Array)
        expect(Passenger.premium_members).to eq([@p3])
      end

      it "#most_frequent_driver returns the first driver with the most trips associated with the given passenger" do
        expect(@p3.most_frequent_driver).to eq(@d1)
        expect(@p4.most_frequent_driver).to eq(@d3)
      end
    end
  end

  describe Ride do
    context "day 1 specs" do
      it "has a distance" do
        expect(@r1.distance).to eq(4.2)
        expect(@r3.distance).to eq(2.5)
      end

      it "has a driver" do
        expect(@r2.driver).to eq(@d1)
        expect(@r4.driver).to eq(@d2)
      end

      it "has a passenger" do
        expect(@r5.passenger).to eq(@p4)
        expect(@r7.passenger).to eq(@p3)
      end

      it "has an .all method that returns an array of all of the Ride objects" do
        expect(Ride.all).to be_a_kind_of(Array)
        expect(Ride.all.length).to eq(9)
        expect(Ride.all.first).to be_a_kind_of(Ride)
      end
    end

    context "day 2 specs" do
      it "has an .average_distance method that returns the average distance for all rides" do
        expect(Ride.average_distance).to eq(4.4)
      end
    end
  end
end
