require('./credit_ratings')

class Tenant
  attr_reader :name, :age, :credit_score

  # has a name, age, and credit score
  def initialize(name, age, credit_score)
    @name = name
    @age = age
    @credit_score = credit_score
  end

  def credit_rating
    cal_credit_rating @credit_score
  end
end

