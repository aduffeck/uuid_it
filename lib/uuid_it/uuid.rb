class Uuid < ::ActiveRecord::Base
  belongs_to :uuidable, :polymorphic => true
end
