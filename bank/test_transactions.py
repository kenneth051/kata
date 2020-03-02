import account
from unittest import TestCase, skip
from unittest.mock import Mock, patch, call     

class TestTransactionHistory(TestCase):
    
    def test_transaction_history(self):
        transaction_history= account.TransactionHistory()
        self.assertEquals(transaction_history.history, [])

    def test_add_transaction_history(self):
        transaction_history = account.TransactionHistory()
        transaction_history.add(2000)
        self.assertEquals(transaction_history.history, [2000])   

    def test_get_transaction_history(self):
        transaction_history = account.TransactionHistory()
        transaction_history.add(4000)
        self.assertEquals(transaction_history.get_transaction(), [4000])  
        
     