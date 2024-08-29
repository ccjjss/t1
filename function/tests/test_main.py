import unittest
import sys
import os

# Agrega el directorio 'function' al PYTHONPATH
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from main import get_data  # Importa la función desde main.py

class TestAPI(unittest.TestCase):

    def test_get_data(self):
        request = None  # Simula una solicitud, ajusta según sea necesario
        response = get_data(request)
        self.assertIsInstance(response, dict)
        self.assertIn("data", response)

if __name__ == '__main__':
    unittest.main()

