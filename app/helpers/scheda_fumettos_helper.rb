module SchedaFumettosHelper
	

  def scheda_fumetto_serie_column(record, column)
	if record.collana.size == 2
		 "#{record.collana[0]} n. #{record.collana[1]}"
	end
  end
  
  def scheda_fumetto_collana_column(record, column)
  	if record.serie.size == 2
		 "#{record.serie[0]} n. #{record.serie[1]}"
    end
  end
  
  def scheda_fumetto_copertina_column(record, column)
    image_tag(record.copertina, :alt => "Image", :height => '80')
  end
  
  def scheda_fumetto_copertina_show_column(record, column)
    image_tag(record.copertina, :alt => "Image")
  end

end