class PuffinOrder < ActiveRecord::Base
  belongs_to :fundraiser

  def self.puffin_flavors
    return [ :cinnamon, :creamcheese, :strawberry, :blueberry, :apple, :chocolate, :caramel ]
  end
  
  def total_puffins
    total = 0
    PuffinOrder.puffin_flavors.each do |flavor|
      total += self.send(flavor.to_s)
    end
    return total
  end
  
  def due
    return 12.0*(total_puffins)
  end

  def owed
    return due - paid
  end
  
  def organization_profit
    return 666.0
  end
  
end
