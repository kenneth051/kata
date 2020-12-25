import io
import sys
from datetime import date


class Transaction:
    total = 0

    def __init__(self, amount, date):
        self.amount = amount
        self.date = date


class WithdrawMoney(Transaction):
    def __init__(self, amount, date):
        super().__init__(amount, date)
        Transaction.total -= amount

    def withdraw_money(self):
        return [self.date, "", self.amount, Transaction.total]


class AddMoney(Transaction):
    def __init__(self, amount, date):
        super().__init__(amount, date)
        Transaction.total += amount

    def deposit_money(self):
        return [self.date, self.amount, "", Transaction.total]


class Statement:
    def __init__(self, history):
        self.history = history

    def __str__(self):
        header = "Date| Credit | Debit | Balance\n"
        body = ""
        for i in self.history:
            statement = "{} | {} | {} | {}\n".format(i[0], i[1], i[2], i[3])
            body += statement
        return header + body


class TransactionHistory:
    def __init__(self):
        self.history = []

    def add(self, transaction):
        self.history.append(transaction)


class Account:
    def __init__(self, history=TransactionHistory(), output=sys.stdout):
        self.history = history
        self.output = output

    def deposit(self, money):
        transaction = AddMoney(money, date.today())
        self.history.add(transaction.deposit_money())

    def withdraw(self, amount):
        transaction = WithdrawMoney(amount, date.today())
        self.history.add(transaction.withdraw_money())

    def printStatement(self):
        statement = Statement(self.history.history)
        data = statement.__str__()
        self.output.write(data)
