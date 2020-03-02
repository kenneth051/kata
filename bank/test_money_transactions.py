from unittest import TestCase
from unittest.mock import Mock, patch, call
from account import AddMoney, WithdrawMoney, Transaction
from datetime import date

class DepositMoney(TestCase):
    def test_deposit_money(self):
        add_money = AddMoney(1000,date.today())
        transaction = add_money.depositMoney()
        self.assertEquals(transaction, [date.today(),1000,'',1000])
    
    def test_deposit_more_money(self):
        Transaction.total=0
        add_money = AddMoney(1000,date.today())
        transaction = add_money.depositMoney()
        self.assertEquals(transaction, [date.today(),1000,'',1000])
        
        add_money = AddMoney(2000,date.today())
        transaction = add_money.depositMoney()
        self.assertEquals(transaction, [date.today(),2000,'',3000])

    def test_money_withdraw(self):
        Transaction.total=0
        add_money = AddMoney(4000,date.today())
        transaction = add_money.depositMoney()
        self.assertEquals(transaction, [date.today(),4000,'',4000])
        
        withdraw = WithdrawMoney(2000,date.today())
        transaction = withdraw.withdraw_money()
        self.assertEquals(transaction, [date.today(),"",2000,2000])
        

        