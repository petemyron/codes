class Code < ActiveRecord::Base
  validates :code, :presence => true, :uniqueness => true
  validates :productId, :presence => true
  validates :amount, :presence => true
  validates :currency, :presence => true
  validates :organization, :presence => true
end

