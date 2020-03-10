def find_item_by_name_in_collection(name, collection)

  i = 0 
  while i < collection.length do 
    if collection[i][:item] === name
      result = collection[i]
    end 
    i += 1
    end
  result 
end

def consolidate_cart(cart)
  i = 0
  consolidated = []

  while i < cart.count do
    item_name = cart[i][:item]
    item_exists = find_item_by_name_in_collection(item_name, consolidated)
    if item_exists
      item_exists[:count] += 1
    else
      cart[i][:count] = 1
      consolidated << cart[i]
    end
    i += 1
  end

  consolidated
end


def apply_coupons(cart, coupons)

  
  i = 0
  
  while i < coupons.length do
    coupon = coupons[i]
    item_name = coupon[:item]
    discounted_item = find_item_by_name_in_collection(item_name, cart)
    coupon_count = coupon[:num]
    coupon_price = coupon[:cost]
    item_exists = !!discounted_item
    
    if item_exists and discounted_item[:count] >= coupon_count
      discount_price = ( coupon_price / coupon_count).round(2)
      discounted_cart = {
        :item => "#{item_name} W/COUPON",
        :price => discount_price,
        :count => coupon_count
      }
      discounted_cart[:clearance] = discounted_item[:clearance]
      discounted_item[:count] -= coupon[:num]
      cart << discounted_cart
    end
    
    i += 1
  end 
  
  cart
end


def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  i = 0
  while i < cart.length do 
    if cart[i][:clearance] == true 
      cart[i][:price] *= .80
    
  end 
  cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end

