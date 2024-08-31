from flask import Flask, request
import unittest
from main import publish_data, insert_data

class TestAPI(unittest.TestCase):
    def setUp(self):
        self.app = Flask(__name__)
        self.app_context = self.app.app_context()
        self.app_context.push()
        self.client = self.app.test_client()

    def tearDown(self):
        self.app_context.pop()

    def test_publish_data(self):
        with self.app.test_request_context(json={
            "data": {
                "id": "123",
                "name": "Test Data",
                "value": 12.3
            }
        }):
            response, status_code = publish_data(request)
            self.assertEqual(status_code, 200)

    def test_insert_data(self):
        with self.app.test_request_context(json={
            "data": {
                "id": "123",
                "name": "Test Data",
                "value": 12.3
            }
        }):
            response, status_code = insert_data(request)
            self.assertEqual(status_code, 200)

if __name__ == '__main__':
    unittest.main()

