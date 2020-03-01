from unittest import TestCase, skip
from unittest.mock import Mock, patch, call
import io
import sys
from datetime import date

class WithdrawMoney:
    def __init__(self, amount, date):
        pass

class AddMoney:
    def __init__(self, amount,date,boy="hello"):
        pass

class Statement:
    def __init__(self):
        pass


class Account:
    def __init__(self,history, output=sys.stdout):
        self.history = history
        self.output = output
    
    def deposit(self, money):
        transaction = AddMoney(money, date.today())
        self.history.add(transaction)

    def withdraw(self, amount):
        transaction = WithdrawMoney(amount, date.today())
        self.history.deduct(transaction)
    
    def printStatement(self):
        statement=Statement(self.history)
        self.output.write(statement)
        