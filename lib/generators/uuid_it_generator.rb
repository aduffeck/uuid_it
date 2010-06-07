require 'rails/generators'
require 'rails/generators/migration'

class UuidItGenerator < Rails::Generators::Base
  include Rails::Generators::Migration

  def copy_files(*args)
    migration_template File.join(File.dirname(__FILE__), "..", "..", "generators", "uuid_it", "templates", "create_uuids.rb"),
                                 "db/migrate/create_uuids.rb"
  end

  def self.next_migration_number dirname
    if ActiveRecord::Base.timestamped_migrations
      Time.now.utc.strftime("%Y%m%d%H%M%S")
    else
      "%.3d" % (current_migration_number(dirname) + 1)
    end
  end
end