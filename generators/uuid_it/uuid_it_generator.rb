class UuidItGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      m.migration_template('create_uuids.rb', "db/migrate", :migration_file_name => 'create_uuids')
    end
  end
end
