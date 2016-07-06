require('./building')
require('./apartment')
require('./tenant')

#building list
beaumount = Building.new '8 Shek Kok Road'

#apartment list
apt101 = Apartment.new 101, 15800, 25000, 3, 2
apt102 = Apartment.new 102, 16000, 25000, 3, 2
apt201 = Apartment.new 201, 14700, 20000, 3, 2
apt202 = Apartment.new 202, 16200, 25000, 3, 2
apt203 = Apartment.new 203, 16000, 25000, 3, 2


#tenants list
john = Tenant.new 'John Doe', 30, 680
mary = Tenant.new 'Mary Sue', 26, 565
ozamu = Tenant.new 'Ozamu Suzuki', 50, 780
louie = Tenant.new 'Louie Zhang', 22, 550
carl = Tenant.new 'Carl Rover', 43, 740
lee = Tenant.new 'Lee Jong', 34, 750

puts "-----------------------------"
puts "ADDING APARTMENTS TO BUILDING"
puts "-----------------------------"
puts "loading..."
beaumount.add_apt apt101
beaumount.add_apt apt102
beaumount.add_apt apt201
beaumount.add_apt apt202
beaumount.add_apt apt203

puts "---------------------------"
puts "ADDING TENANTS TO APARTMENT"
puts "---------------------------"
puts "loading..."
apt101.add_tenant john
apt101.add_tenant mary
apt102.add_tenant carl
apt201.add_tenant ozamu
apt202.add_tenant lee
# apt101.add_tenant louie       # BadCreditRatingsErr
# apt101.add_tenant carl        # Overload

puts "--------------------"
puts "TENANT CREDIT RATING"
puts "--------------------"
p "tenant name: #{john.name}"
p "credit rating: #{john.credit_rating}"
puts
p "tenant name: #{mary.name}"
p "credit rating: #{mary.credit_rating}"
puts
p "tenant name: #{ozamu.name}"
p "credit rating: #{ozamu.credit_rating}"
puts
p "tenant name: #{louie.name}"
p "credit rating: #{louie.credit_rating}"
puts
p "tenant name: #{carl.name}"
p "credit rating: #{carl.credit_rating}"
puts
p "tenant name: #{lee.name}"
p "credit rating: #{lee.credit_rating}"

puts "----------------"
puts "APARTMENT STATUS"
puts "----------------"
p "apartment: #{apt101.number}"
p "number of tenants: #{apt101.tenants.count}"
p "tenants: #{apt101.tenants}"
p "score: #{apt101.avg_credit_score}"
p "rating: #{apt101.avg_credit_rating}"
puts
p "apartment: #{apt102.number}"
p "number of tenants: #{apt102.tenants.count}"
p "tenants: #{apt102.tenants}"
p "score: #{apt102.avg_credit_score}"
p "rating: #{apt102.avg_credit_rating}"
puts
p "apartment: #{apt201.number}"
p "number of tenants: #{apt201.tenants.count}"
p "tenants: #{apt201.tenants}"
p "score: #{apt201.avg_credit_score}"
p "rating: #{apt201.avg_credit_rating}"
puts
p "apartment: #{apt202.number}"
p "number of tenants: #{apt202.tenants.count}"
p "tenants: #{apt202.tenants}"
p "score: #{apt202.avg_credit_score}"
p "rating: #{apt202.avg_credit_rating}"

puts
p "apartment: #{apt203.number}"
p "number of tenants: #{apt203.tenants.count}"
p "tenants: #{apt203.tenants}"

puts "---------------------------------"
puts "REMOVING TENANT(S) FROM APARTMENT"
puts "---------------------------------"
puts "loading..."
apt101.rm_tenant john
puts "removed john"
# apt101.rm_all_tenants

puts "---------------------------------"
puts "REMOVING APARTMENT FROM BUILDING"
puts "---------------------------------"
puts "loading..."
beaumount.rm_apt apt203
puts "removed apt203"
# beaumount.rm_apt 101    #OccupiedErr

puts "---------------"
puts "BUILDING STATUS"
puts "---------------"
p "apartments: #{beaumount.apartments.count}"
p "apartments group: #{beaumount.apartments_group_by_credit_rating}"
p "tenants list: #{beaumount.tenants_list}"
p "square footage: #{beaumount.total_square_footage}"
p "monthly revenue: #{beaumount.total_monthly_revenue}"

