require 'minitest/autorun'

require_relative 'cash_register'
require_relative 'transaction'

class Cash_register_test < MiniTest::Test

  def test_accept_money
    register = CashRegister.new(100)
    trans = Transaction.new(50)
    trans.prompt_for_payment
    assert_equal(register.accept_money(trans),150)
  end

  def test_change
    register = CashRegister.new(100)
    trans = Transaction.new(50)
    trans.amount_paid = 300
    assert_equal(register.change(trans),250)
  end

  def test_give_receipt
    register = CashRegister.new(100)
    trans = Transaction.new(50)
    string = "You've paid $50.\n"
    assert_output(string){register.give_receipt(trans)}
  end

  def test_prompt_for_payment
    trans = Transaction.new(50)
    input = StringIO.new('50\n')
    trans.prompt_for_payment(input: input)
    assert_equal(trans.amount_paid,50)
  end
end



