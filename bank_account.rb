class BankAccount

  @@interest_rate = 1.5
  @@accounts = []

def initialize
  @balance = 0
end

def self.create
  new_bank_account = BankAccount.new
  @@accounts << new_bank_account
  return new_bank_account
end

def self.total_funds
  sum = 0
  @@accounts.each {|value|
    sum += value.balance
}
  return sum
end

def self.interest_time
  @@accounts.each {|value|
    @balance *= @@interest_rate
}
end




def balance
  @balance
end

def writer_balance(innie)
  @balance = innie
end

def deposit(accepted_number)
  @balance += accepted_number
end

def withdraw(accepted_number)
  @balance -= accepted_number
end



end

my_account = BankAccount.create
your_account = BankAccount.create
puts my_account.balance # 0
puts BankAccount.total_funds # 0
my_account.deposit(200)
your_account.deposit(1000)
puts my_account.balance # 200
puts your_account.balance # 1000
puts BankAccount.total_funds # 1200
BankAccount.interest_time
puts my_account.balance # 202.0
puts your_account.balance # 1010.0
puts BankAccount.total_funds # 1212.0
my_account.withdraw(50)
puts my_account.balance # 152.0
puts BankAccount.total_funds # 1162.0
