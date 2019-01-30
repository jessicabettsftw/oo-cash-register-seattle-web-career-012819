require 'pry'
class CashRegister

  attr_accessor :discount, :total

  ITEMS = {}

  def initialize(discount=nil)
    @total = 0
    @discount = discount
  end

  def add_item(title, price, quantity=nil)

    ITEMS[title] = {}
    ITEMS[title]["price"] = price
    if quantity != nil
      self.total += (price * quantity)
      ITEMS[title]["quantity"] = quantity
    else
      self.total += price
    end
  end

  def apply_discount
    if self.discount != nil
      percentage = (1 - ((self.discount().to_f/100)))
      discount_price = (percentage * self.total)
      self.total = discount_price.round
      return "After the discount, the total comes to $#{discount_price.round}."
    else
      return "There is no discount to apply."
    end
  end

  def items
    ITEMS.keys
  end
end
