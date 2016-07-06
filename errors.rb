# Check tenant accountability before adding to apartment
class BadCreditRatingsErr < Exception
end

# cannot find tenant
class NoTenantErr < Exception
end

# cannot find apartment
class NoApartmentErr < Exception
end

# check bedrooms availability before adding tenants to apartment
class OverloadErr < Exception
end

# check occupancy before removing apartment in a building
class OccupiedErr < Exception
end