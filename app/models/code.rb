class Code < ActiveRecord::Base

  validates_presence_of :code, :productId, :amount, :currency


end

