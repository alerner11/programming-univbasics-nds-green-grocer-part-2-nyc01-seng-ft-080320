require_relative './part_1_solution.rb'

def apply_coupons(cart, coupons)
  
  cart_with_coupons = []
  
  cart.each do |item_hash|

    has_coupon = find_item_by_name_in_collection(item_hash[:item], coupons)
    
    if has_coupon
      
      # check if there's enough in the cart to qualify for the coupon
      if item_hash[:count] >= has_coupon[:num] 
        
        # I DO NOT UNDERSTAND WHY WE NEED TO STORE THESE VALUES IN VARIABLES BUT OK
        orig_count = item_hash[:count]
        remainder = item_hash[:count] % has_coupon[:num]
        
        # add coupon-less item to cart_with_coupons, update count for coupon-less item to equal remainder 
        cart_with_coupons << item_hash
        cart_with_coupons[-1][:count] = remainder
        
        # now they definitely divide evenly
        cart_with_coupons << {
          item: "#{item_hash[:item]} W/COUPON",
          price: has_coupon[:cost].to_f / has_coupon[:num].to_f,
          clearance: item_hash[:clearance],
          count: orig_count - remainder
        }
      end
      
    # if there is no coupon, just shovel it into cart_with_coupons as is
    else
      cart_with_coupons << item_hash
    end
  end
  cart_with_coupons
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

cons_cart = [
  {:item => "AVOCADO", :price => 3.00, :clearance => true, :count => 3},
  {:item => "KALE",    :price => 3.00, :clearance => false, :count => 1}
]

coupons_list = [
  {:item => "AVOCADO", :num => 2, :cost => 5.00}
]

apply_coupons(cons_cart, coupons_list)