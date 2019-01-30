require 'pry'
class CashRegister

  attr_accessor :discount, :total, :cart



  def initialize(discount=nil)
    @total = 0
    @discount = discount
    @cart = []
  end

  def add_item(title, price, quantity=nil)

    current_item = {title => {"price" => price, "quantity" => quantity}}
    cart << current_item
    if quantity != nil
      self.total += (price * quantity)
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
    items_array = []
    cart.each_with_index do |item, index|
      item.each do |name, info|
        num_in_cart = cart[index][name]["quantity"]
        if num_in_cart != nil
          num_in_cart.times do
            items_array << name
          end
        else
            items_array << name
        end
      end
    end
    items_array
  end

  def void_last_transaction
    transaction_hash = cart[-1]
    transaction_hash.each do |name, info|
      quantity = transaction_hash[name]["quantity"]
      price = transaction_hash[name]["price"]
      if (quantity != nil)
        self.total -= (quantity * price)
      else
        self.total -= price
      end
    end
    self.total
  end

end
