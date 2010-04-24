class Fundraiser < ActiveRecord::Base
  belongs_to :organization
  has_many :puffin_orders

  named_scope :active, lambda { { :conditions => ['delivery_date >= ?', 1.day.ago] } }
  named_scope :old, lambda { { :conditions => ['delivery_date < ?', 1.day.ago] } }
  
end
