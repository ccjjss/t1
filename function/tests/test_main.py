from flask import Flask, request
import unittest
from main import get_data

class TestAPI(unittest.TestCase):
    def setUp(self):
        self.app = Flask(__name__)
        self.app_context = self.app.app_context()
        self.app_context.push()
        self.client = self.app.test_client()

    def tearDown(self):
        self.app_context.pop()

    def test_get_data(self):
        # Simular un contexto de solicitud y obtener el objeto 'request'
        with self.app.test_request_context(json={
            "data": {
                "id": "123",
                "name": "Test Data",
                "value": 12.3
            }
        }):
            # Pasar explícitamente el objeto 'request' a la función
            response = get_data(request)
            self.assertEqual(response.status_code, 200)

if __name__ == '__main__':
    unittest.main()

