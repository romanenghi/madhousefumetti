class Editore < ActiveRecord::Base
  attr_accessible :nome
  has_many :collanas
  def to_label
    "#{nome}"
  end
end
