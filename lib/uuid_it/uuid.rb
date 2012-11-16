class Uuid < ::ActiveRecord::Base
  belongs_to :uuidable, :polymorphic => true
  attr_accessible :uuid
end
