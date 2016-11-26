class Product < ApplicationRecord
	def tax
    price.to_i * 0.07
  end

  def total
    price.to_i + tax
  end
end
