class Product < ActiveRecord::Base
  belongs_to :editore
  has_many :productcollanas
  has_many :barcodes
  has_many :collanas, :through => :productcollanas, :readonly => false

  def to_label
    t = ""
    self.productcollanas.each do |collana|
      t << "#{collana.collana.nome} n. #{collana.numero}"
    end
    "#{t} - #{titolo}"
  end
end
