module ProductsHelper
	def product_copertina_column(record, column)
	image_tag(record.copertina, :alt => "Image", :height => '80')
  end
end