import unittest

class Bowling():
    def __init__(self):
        self.rolls=[]

    def game_rolls(self,pins):
        """method to add the number of rolls made by players
        Arguments:
            pins {list} -- A list of scores made by a player
        """
        for pin in pins:
         self.rolls.append(pin)

    
    def score(self):
        """Method to verify bowling scores
        
        Returns:
            Int -- total score value
        """

        score = 0
        index = 0

        for _ in range(0,10):
            #check if a perfect strike is made(10)
            if self.rolls[index] == 10:
                score += 10 + self.rolls[index + 1]+ self.rolls[index + 2]
                index += 1
            #check if the first roll and second roll adds up t 10
            elif self.rolls[index] + self.rolls[index + 1] == 10:
                score += 10 + self.rolls[index + 2]
                index += 2
            #if not the first two options
            else:    
                score+= self.rolls[index]+ self.rolls[index+1]
                index +=2
        return score
            


class TestBowling(unittest.TestCase):
    """bowling test class"""

    def setUp(self):
        self.game= Bowling()

    def test_0(self):
        self.game.game_rolls([0]*20)
        self.assertEquals(0, self.game.score())

    def test_1(self):
        self.game.game_rolls([1]*20)
        self.assertEquals(20, self.game.score())
    
    def test_2(self):
        self.game.game_rolls([10]*20)
        self.assertEquals(300, self.game.score())

    def test_3(self):
        self.game.game_rolls([4, 6, 5] + 17 * [0])

        self.assertEqual(20, self.game.score())

        
if __name__ == '__main__':
    unittest.main()
