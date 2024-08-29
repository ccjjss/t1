import unittest
from main import get_data

class TestAPI(unittest.TestCase):

    def test_get_data(self):
        request = None  # Simula una solicitud, ajusta según sea necesario
        response = get_data(request)
        self.assertIsInstance(response, dict)
        self.assertIn("data", response)

if __name__ == '__main__':
    unittest.main()

