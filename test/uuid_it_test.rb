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

  test "should only create one uuid object when a new object with a uuid is saved" do
    assert_difference "Uuid.count", 1 do
      c = Car.new
      assert c.uuid
      c.save!
    end
  end

  test "should not leak Uuid objects on unsaved uuidables" do
    assert_difference "Uuid.count", 0 do
      1..3.times do
        Car.new.uuid
      end
    end
  end

  test "find_by_uuid must not available on classes without uuid_it" do
    assert_nil Car.find_by_uuid("bla")
    assert_raise(NoMethodError) { Bike.find_by_uuid("bla") }
  end
end
