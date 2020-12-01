import unittest
import app

class TestHelloWorld(unittest.TestCase):

    def test_hello_world(self):
        import app
        self.assertEqual(app.hello_world(), "Hello, World!")

if __name__ == '__main__':
    unittest.main()