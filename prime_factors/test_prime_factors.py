import unittest


def prime_factors(number):
    """method to get prime factors of a number

    Arguments:
        number {int} -- input number to get its prime factors.

    Returns:
        List -- [A list of prime factors.
    """
    factors = []

    # checks if the input is less than 2 then returns an empty list.
    if number < 2:
        return []

    # checks if the input is equal to 2 then returns 1 in a list.
    if number == 2:
        return [1]

    for factor in range(2, number + 1):
        # condition to check whether the input number when divided by the number in iteration gives a remainder 0
        while number % factor == 0:
            factors.append(factor)
            number = number / factor

    return factors


class TestPrimeFactors(unittest.TestCase):
    """Prime factors test class"""

    def test_0(self):
        self.assertEquals(prime_factors(0), [])

    def test_1(self):
        self.assertEquals(prime_factors(1), [])

    def test_2(self):
        self.assertEquals(prime_factors(2), [1])

    def test_3(self):
        self.assertEquals(prime_factors(3), [3])

    def test_4(self):
        self.assertEquals(prime_factors(4), [2, 2])

    def test_5(self):
        self.assertEquals(prime_factors(5), [5])

    def test_8(self):
        self.assertEquals(prime_factors(8), [2, 2, 2])

    def test_9(self):
        self.assertEquals(prime_factors(9), [3, 3])

    def test_25(self):
        self.assertEquals(prime_factors(25), [5, 5])


if __name__ == "__main__":
    unittest.main()