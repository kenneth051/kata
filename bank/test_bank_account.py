from unittest import TestCase, skip
from unittest.mock import Mock, patch, call
from account import Account
from datetime import date


class FakeOutput:
    def write(self, text):
        self.text = text

    def getValue(self):
        return self.text


class TestBankAccount(TestCase):
    @skip
    def test_bank_0(self):
        fake_output = FakeOutput()
        account = Account(history={}, output=fake_output)
        account.deposit(1000)
        account.withdraw(1000)
        account.printStatement()

        self.assertEquals(
            "Credit|Balance\
            1000| 1000\
            1000| 0 ",
            fake_output.getValue(),
        )

    @patch("account.date")
    @patch("account.AddMoney")
    def test_account_deposit_money(self, mock_add_money, mock_date):
        add_money_mock = mock_add_money.return_value
        deposit_money = add_money_mock.deposit_money.return_value
        mock_date.today.return_value = date(year=2020, month=2, day=11)
        transaction_history = Mock()
        test_account = Account(history=transaction_history)
        test_account.deposit(1000)

        # assertions
        mock_add_money.assert_called_with(1000, date(2020, 2, 11))
        transaction_history.add.assert_called_with(deposit_money)

    @patch("account.date")
    @patch("account.WithdrawMoney")
    def test_account_withdraw_money(self, mock_withdraw_money, mock_date):

        withdraw_money_mock = mock_withdraw_money.return_value
        withdraw_money = withdraw_money_mock.withdraw_money.return_value
        mock_date.today.return_value = date(year=2020, month=2, day=12)
        transaction_history = Mock()
        test_account = Account(history=transaction_history)
        test_account.withdraw(500)

        # assertions
        mock_withdraw_money.assert_called_with(500, date(2020, 2, 12))
        transaction_history.deduct.assert_called_with(withdraw_money)

    @patch("account.Statement")
    def test_account_statement(self, mock_account_statement):

        account_statement_mock = mock_account_statement.return_value
        print_statement = account_statement_mock.get_history.return_value
        transaction_history = Mock()
        test_account = Account(history=transaction_history)
        test_account.output = Mock()
        test_account.printStatement()

        # assertions
        mock_account_statement.assert_called_with(transaction_history)
        test_account.output.write.assert_called_with(print_statement)
