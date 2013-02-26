class Collana < ActiveRecord::Base
  belongs_to :editore
  has_many :productcollanas
  has_many :products, :through => :productcollanas, :readonly => false
  def to_label
    "#{nome}"
  end
end
