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
        
        # if it doesn't divide evenly, add coupon-less item to cart_with_coupons, update count to = remainder, subtract remainder from item_hash[:count] 
        if item_hash[:count] % has_coupon[:num] > 0
           coupon_hash = item_hash
           cart_with_coupons << coupon_hash
           cart_with_coupons[-1][:count] = item_hash[:count] % has_coupon[:num]
           item_hash[:count] = item_hash[:count] - cart_with_coupons[-1][:count]
        end
        
        # now they definitely divide evenly
        cart_with_coupons << {
          item: "#{item_hash[:item]} W/COUPON",
          price: has_coupon[:cost].to_f / has_coupon[:num].to_f,
          clearance: item_hash[:clearance],
          count: item_hash[:count]
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

cons_cart = [
  {:item => "AVOCADO", :price => 3.00, :clearance => true, :count => 3},
  {:item => "KALE",    :price => 3.00, :clearance => false, :count => 1}
]

coupons_list = [
  {:item => "AVOCADO", :num => 2, :cost => 5.00}
]

apply_coupons(cons_cart, coupons_list)