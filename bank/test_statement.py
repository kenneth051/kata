from unittest import TestCase, skip
from unittest.mock import Mock, patch, call
from account import Statement, Account


class TestStatement(TestCase):
    def test_no_transaction(self):
        transaction_history = Mock()
        transaction_history.history.return_value = []
        statement = Statement(transaction_history.history.return_value)
        self.assertEquals(statement.__str__(), "Date| Credit | Debit | Balance\n")
