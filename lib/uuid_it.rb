require File.join(File.dirname(__FILE__), "uuid_it", "uuid.rb")
require File.join(File.dirname(__FILE__), "ruby-uuid", "uuid.rb")

module ActiveRecord
  module Acts

    module UuidIt
      def uuid_it
        class_eval do
          send :include, InstanceMethods
          send :extend, ClassMethods
          has_one :uuid_object, :as => :uuidable, :class_name => "Uuid", :dependent => :destroy
          after_create :assign_uuid
        end
      end
      
      module ClassMethods
        def find_by_uuid uuid
          return Uuid.find_by_uuidable_type_and_uuid(self.name, uuid).try(:uuidable)
        end
      end

      module InstanceMethods
        def uuid
          assign_uuid unless self.uuid_object
          self.uuid_object.uuid
        end

        def assign_uuid
          return if self.uuid_object.present?

          self.build_uuid_object(:uuid => UUID.create.to_s)
          self.save unless self.new_record?
        end
      end
    end
  end
end

ActiveRecord::Base.class_eval do
  extend ActiveRecord::Acts::UuidIt
end
