import account
from unittest import TestCase, skip
from unittest.mock import Mock, patch, call     

class TestTransactionHistory(TestCase):
    
    def test_get_transaction_history(self):
        transaction_history= account.TransactionHistory()
        self.assertEquals(transaction_history.history, [])
        