require 'test_helper'

class Car < ActiveRecord::Base
  uuid_it
end

class Bike < ActiveRecord::Base
end

class Scooter < ActiveRecord::Base
  uuid_it
end

class UuidItTest < ActiveSupport::TestCase
  test "should assing Uuids to new objects" do
    c = Car.create
    assert c.uuid_object
    assert c.uuid.present?

    c2 = Car.create
    assert_not_equal c.uuid, c2.uuid
  end

  test "should assing Uuid to already existing objects on first access" do
    b1 = nil
    assert_difference "Uuid.count", 0 do
      b1 = Bike.create
    end
    Bike.class_eval do
      uuid_it
    end
    assert_nil b1.uuid_object
    b1.uuid
    assert b1.uuid_object
    assert b1.uuid.present?

    b2 = Bike.create
    assert b2.uuid_object
    assert b2.uuid.present?
  end

  test "find_by_uuid" do
    car = Car.create
    scooter = Scooter.create

    assert_nil Car.find_by_uuid("bla")
    assert_equal car, Car.find_by_uuid(car.uuid)
    assert_nil Car.find_by_uuid(scooter.uuid)
  end
end
