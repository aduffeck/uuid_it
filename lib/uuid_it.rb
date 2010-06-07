require File.join(File.dirname(__FILE__), "uuid_it", "uuid.rb")
require File.join(File.dirname(__FILE__), "ruby-uuid", "uuid.rb")

module ActiveRecord
  module Acts
    
    module UuidIt
      def uuid_it
        class_eval do
          send :include, InstanceMethods
          has_one :uuid_object, :as => :uuidable, :class_name => "Uuid", :dependent => :destroy
          after_create :assign_uuid
        end
      end

      module InstanceMethods
        def uuid
          assign_uuid unless self.uuid_object
          self.uuid_object.uuid
        end

        def assign_uuid
          return if Uuid.find_by_uuidable_type_and_uuidable_id(self.class.name, self.id)
          uuid = Uuid.new(:uuidable_id => self.id, :uuidable_type => self.class.name)
          uuid.uuid = UUID.create.to_s
          uuid.save
          self.reload
        end
      end
    end
  end
end

ActiveRecord::Base.class_eval do
  extend ActiveRecord::Acts::UuidIt
end
