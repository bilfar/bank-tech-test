# Bank-tech-test

This is my response to a practice tech-test set in Week 10 at Makers Academy. The aim is to practice my OO design and TDD skills.

## Specification

### Requirements

* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

## Technologies used

 * Ruby
 * Rspec

## Approach to solving the problem.

My approach to solving this problem is to think first about what the program expected to do and how a user will interact with it. I then wrote user stories from the perspective of somebody using the program.  After that, I initialise a Rspec, Rubocop, SimpleCov and Lint in my app. I then broke the problem into smaller pieces. A feature-test was created, so I know what the final result will look like. The first piece I wanted to tackle is when a deposit is made the balance will increase by this amount. I used TDD to solve this issue. (Red, green, refactor) The next piece I wanted to tackle, is adding a date when a deposit has been made.  After that, I refactored the code, so others test will still pass. The next pies I took is the withdraw method. When a withdraw is made, the balance will be updated. next I added a date to the withdraw method. I also made sure that my feature-test passes. I then refactored my code to make its DRY and SRP.

```
As a user,
So that I don't need to carry lots of money with me,
I would like to deposit money into my bank account and see my balance.

As a user,
So I can buy something,
I would like to withdraw money from my bank account, and it should update my balance.

As a user,
So I can track my spendings,
I would like to print an account statement that shows me the date of action, credit, debit and balance.
```

## Dependencies

This app running on the following dependencies:

* Rspec
* Rubocop
* Simplecov
* Simplecov-console


## How to run the code?

* Clone this repository to your local machine.
* Run bundle install.
* Go to the Ruby IRB console and require the file:  require './lib/bank'
* make a new instance of bank: bank = Bank.new
* Add money to the balance: bank.deposit(1000)
* Add money again if you like to the balance: bank.deposit(3500)
* Take money from your balance: bank.withdraw(2500)
* Print out the statements: bank.print_statement

This is how it looks like in the IRB console:

```
bank-tech-test git:(master) irb
[1] pry(main)> require './lib/bank'
=> true

[2] pry(main)> bank = Bank.new
=> #<Bank:0x00007fd61e2ba808 @balance=0, @history=[]>

[3] pry(main)> bank.deposit(1000)
=> [{:date=>"14/08/2018", :credit=>1000, :debit=>"", :balance=>1000}]

[4] pry(main)> bank.deposit(3500)
=> [{:date=>"14/08/2018", :credit=>1000, :debit=>"", :balance=>1000},
{:date=>"14/08/2018", :credit=>3500, :debit=>"", :balance=>4500}]

[5] pry(main)> bank.withdraw(2500)
=> [{:date=>"14/08/2018", :credit=>1000, :debit=>"", :balance=>1000},
 {:date=>"14/08/2018", :credit=>3500, :debit=>"", :balance=>4500},
 {:date=>"14/08/2018", :credit=>"", :debit=>2500, :balance=>2000}]

[6] pry(main)> bank.print_statement
date || credit || debit || balance
14/08/2018 || || 500.00 || 2000.00
14/08/2018 || 2000.00 || || 4500.00
13/08/2018 || 1000.00 || || 1000.00
```

## Test coverage
Bank#deposit
* should add money to the balance when a deposit is made

Bank#withdraw
* should take money from the balance when a withdraw is made
* should print a bank-statement

Bank#statement
* should show a list of date, credit, debit and balance

Printer#to_screen
* should print a formatted statement

Transaction
* saves a transaction to the history when deposit is made
* saves a transaction to the history when withdraw is made
```
Finished in 0.01182 seconds (files took 0.14625 seconds to load)

Coverage report: 82 / 82 LOC (100.0%) covered.
```

## Learning outcomes

## Author

This is a solo project by Nabil Far
