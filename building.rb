require('./errors')
require('./credit_ratings')

class Building
  attr_reader :address, :apartments

  def initialize(address, apartments=[])
    @address = address
    @apartments = apartments
  end

  # the list of apartments should not be modified directly (bonus: actually prevent it from being modified directly)
  def apartments
    @apartments.map{|apt| apt.dup}
  end

  # has a total square footage, calculated from all apartments
  def total_square_footage
    total = 0
    @apartments.each{|apartment| total += apartment.square_footage}
    total
  end

  # has a total monthly revenue, calculated from all apartment rents
  def total_monthly_revenue
    total = 0
    @apartments.each{|apartment| total += apartment.rent}
    total
  end

  # has a list of tenants, pulled from the tenant lists of all apartments (!)
  def tenants_list
    @apartments.map(&:tenants).flatten
  end

  # has a method to retrieve all apartments grouped by credit_rating (bonus: sort the groups by credit rating from excellent to bad) (!)
  def apartments_group_by_credit_rating
    group = {excellent: [], great: [], good: [], mediocre: [], bad: []}
    @apartments.each_with_object(group) {|apt, rate| rate[apt.avg_credit_rating] << apt}
  end

  # add an apartment
  def add_apt apartment
    @apartments << apartment
  end

  # remove a specific apartment by its number, which raises an error if the number is not found or the apartment currently has any tenants (bonus: allow overriding this constraint) (!)
  def rm_apt ref
    index = @apartments.index {|apt| apt.number == ref || apt == ref}
    raise NoApartmentErr.new(ref) if index.nil?

    apartment = @apartments[index]
    raise OccupiedErr.new(ref) if apartment.occupied?

    @apartments.delete_at index
  end

end