from urllib.parse import quote
from flask import Flask, request, jsonify
from google.cloud import bigquery
import os

app = Flask(__name__)

# Configura cliente de BigQuery
client = bigquery.Client(project="berrysafetest-15c25")

# Nombre del dataset y tabla en BigQuery
dataset_id = os.environ.get('BIGQUERY_DATASET', 'latam_analytics_dataset')
table_id = os.environ.get('BIGQUERY_TABLE', 'latam_analytics_table')

@app.route('/', methods=['POST'])
def get_data(request):
    try:
        # Capturar el JSON recibido
        data = request.get_json()

        # Validar que las claves esperadas están en el JSON
        if not data or 'data' not in data or not all(k in data['data'] for k in ('id', 'name', 'value')):
            return jsonify({"success": False, "error": "Invalid input data"}), 400

        # Crear un cliente de BigQuery
        table_ref = client.dataset(dataset_id).table(table_id)

        # Preparar los datos a insertar
        rows_to_insert = [
            {
                "data_id": data["data"]["id"],
                "data_name": data["data"]["name"],
                "data_value": data["data"]["value"]
            }
        ]

        # Insertar datos en BigQuery
        errors = client.insert_rows_json(table_ref, rows_to_insert)

        if errors:
            return jsonify({"success": False, "errors": errors}), 400

        return jsonify({"success": True, "message": "Data inserted successfully!"}), 200

    except Exception as e:
        return jsonify({"success": False, "error": str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True)

