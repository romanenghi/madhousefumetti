class CollanasController < ApplicationController
  active_scaffold :collana do |conf|
    conf.columns = [:nome, :editore, :products]
    conf.columns[:editore].form_ui = :select
    
  end
end
