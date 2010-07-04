require 'rubygems'
require 'active_support'
require 'active_support/test_case'
require 'test/unit'
require 'active_record'
ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ":memory:")

require File.dirname(__FILE__) + '/../lib/uuid_it'

silence_stream(STDOUT) do
  ActiveRecord::Schema.define do
    create_table :uuids do |t|
      t.string :uuid
      t.integer :uuidable_id
      t.string :uuidable_type, :limit => 40
    end

    create_table :cars
    create_table :bikes
    create_table :scooters
  end
end
