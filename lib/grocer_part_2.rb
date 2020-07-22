require_relative './part_1_solution.rb'

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  
  cart_with_coupons = []
  
  cart.each do |item_hash|
    # store whether there's a coupon for ease of typing later
    # returns coupon hash if there is a coupon, nil if not
    has_coupon = find_item_by_name_in_collection(item_hash[:item], coupons)
    
    # if the item has a coupon 
    # then transfer the appropriate number of items to new W/COUPON item hash
    # including cost per each in that W/COUPON item hash
    if has_coupon
      
      # check if there's enough in the cart to qualify for the coupon
      if item_hash[:count] >= has_coupon[:num] 
        
        # I DO NOT UNDERSTAND WHY WE NEED TO STORE THESE VALUES IN VARIABLES BUT OK
        orig_count = item_hash[:count]
        remainder = item_hash[:count] % has_coupon[:num]
        
        # if it doesn't divide evenly, add coupon-less item to cart_with_coupons, update count for coupon-less item to equal remainder 
        if remainder > 0
          cart_with_coupons << item_hash
          cart_with_coupons[-1][:count] = remainder
        end
        
        # now they definitely divide evenly
        cart_with_coupons << {
          item: "#{item_hash[:item]} W/COUPON",
          price: has_coupon[:cost].to_f / has_coupon[:num].to_f,
          clearance: item_hash[:clearance],
          count: orig_count - remainder
        }
      end
      
    # if there is no coupon, just shovel it into coupon_cart as is
    else
      cart_with_coupons << item_hash
    end
  end
  puts cart_with_coupons
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
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

