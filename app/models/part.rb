class Part < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :product
end
