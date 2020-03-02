from unittest import TestCase, skip
from unittest.mock import Mock, patch, call
import io
import sys
from datetime import date

class Transaction:
    total = 0
    def __init__(self,amount,date):
        self.amount = amount
        self.date = date
        
class WithdrawMoney(Transaction):
    def __init__(self, amount,date):
        super().__init__(amount,date)
        Transaction.total -= amount
    
    def withdraw_money(self):
        return [self.date,"",self.amount, Transaction.total]
        

class AddMoney(Transaction):
    def __init__(self, amount,date):
        super().__init__(amount,date)
        Transaction.total += amount

    def deposit_money(self):
        return [self.date, self.amount,"", Transaction.total]
        
class Statement:
    def __init__(self):
        pass

class TransactionHistory:
    def __init__(self):
        self.history = []

    def add(self, transaction):
        self.history.append(transaction)
    
    def get_transaction(self):
        return self.history
    

class Account:
    def __init__(self,history, output=sys.stdout):
        self.history = history
        self.output = output
    
    def deposit(self, money):
        transaction = AddMoney(money, date.today())
        self.history.add(transaction.deposit_money())

    def withdraw(self, amount):
        transaction = WithdrawMoney(amount, date.today())
        self.history.deduct(transaction.withdraw_money())
    
    def printStatement(self):
        statement=Statement(self.history)
        self.output.write(statement)
        