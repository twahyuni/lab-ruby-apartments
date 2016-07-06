require('./errors')
require('./credit_ratings')

class Apartment
  attr_reader :tenants, :number, :rent, :square_footage, :bedrooms, :bathrooms

  # has a number, rent, square footage, number of bedrooms, and number of bathrooms
  def initialize(number, rent, square_footage, bedrooms, bathrooms, tenants=[])
    @number = number
    @rent = rent
    @square_footage = square_footage
    @bedrooms = bedrooms
    @bathrooms = bathrooms
    @tenants = tenants
  end

  # the list of tenants should not be modified directly (bonus: actually prevent it from being modified directly)
  def tenants
    @tenants.map{|t| t.dup}
  end

  # has an average credit score, calculated from all tenants
  def avg_credit_score
    total = 0
    @tenants.each{|tenant| total += tenant.credit_score}

    avg = total.to_f / @tenants.count
    avg

  end

  # has a credit rating, calculated from the average credit score using the logic below
  def avg_credit_rating
    cal_credit_rating avg_credit_score
  end

  # has a method to add a tenant that raises an error if the tenant has a "bad" credit rating, or if the new tenant count would go over the number of bedrooms
  def add_tenant tenant
    raise BadCreditRatingsErr.new(tenant), "unable to add tenant due to bad credit ratings" if tenant.credit_rating == "bad"
    raise OverloadErr.new(tenant), "no bedrooms available" if @tenants.count >= @bedrooms

    @tenants << tenant
  end

  # has a method to remove a specific tenant either by object reference or by name (bonus: do this without checking classes), which raises an error if the tenant is not found (!)
  def rm_tenant tenant
    ref = @tenants.reject! {|t| t.name == tenant || t.object_id == tenant || t == tenant}
    raise NoTenant.new(tenant), "Tenant doesn't exist" if ref.nil?

    @tenants.delete ref
  end

  # has a method that removes all tenants
  def rm_all_tenants
    @tenants.clear
  end

  # check if apartment is occupied
  def occupied?
    @tenants.count > 0
  end
end