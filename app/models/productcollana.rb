class Productcollana < ActiveRecord::Base
  belongs_to :collana
  belongs_to :product
  def to_label
    "#{collana.nome} n. #{numero}"
  end
end
