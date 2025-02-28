require 'rails_helper'

RSpec.describe Airline, type: :model do
  describe 'relationships' do
    it {should have_many :flights}
  end

  describe "Instance methods" do
    let!(:southwest) { Airline.create!(name: "SouthWest") }
    let!(:united) { Airline.create!(name: "United") }

    let!(:flight1) { southwest.flights.create!(number: 343, date: "09/04/27", departure_city: "Denver", arrival_city: "Las Vegas") }
    let!(:flight2) { southwest.flights.create!(number: 336, date: "09/04/27", departure_city: "Denver", arrival_city: "Las Vegas") }
    let!(:flight3) { southwest.flights.create!(number: 3276, date: "09/04/27", departure_city: "Denver", arrival_city: "Las Vegas") }
    let!(:flight4) { united.flights.create!(number: 5542, date: "09/04/27", departure_city: "Denver", arrival_city: "Las Vegas") }

    let!(:bob) { Passenger.create!(name: "Bob", age: 34) }
    let!(:rob) { Passenger.create!(name: "Rob", age: 9) }
    let!(:sara) { Passenger.create!(name: "Sara", age: 29) }
    let!(:rachel) { Passenger.create!(name: "Rachel", age: 15) }
    let!(:gina) { Passenger.create!(name: "Gina", age: 36) }

    before do
      flight1.flight_passengers.create!(passenger: bob)
      flight1.flight_passengers.create!(passenger: rob)
      flight2.flight_passengers.create!(passenger: sara)
      flight3.flight_passengers.create!(passenger: rachel)
      flight3.flight_passengers.create!(passenger: sara)
      flight4.flight_passengers.create!(passenger: gina)
    end

    it "#find_passengers" do
      expect(southwest.find_passengers).to eq([bob, sara])
    end

  end
end
