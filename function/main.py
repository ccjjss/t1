from urllib.parse import quote
from flask import Flask, request, jsonify
from google.cloud import bigquery, pubsub_v1
import os
import json

app = Flask(__name__)

# Configura cliente de BigQuery
client = bigquery.Client(project="berrysafetest-15c25")

# Configura cliente de Pub/Sub
project_id = "berrysafetest-15c25"
topic_id = "latam-ingesta-topic"
publisher = pubsub_v1.PublisherClient()
topic_path = publisher.topic_path(project_id, topic_id)

# Nombre del dataset y tabla en BigQuery
dataset_id = os.environ.get('BIGQUERY_DATASET', 'latam_analytics_dataset')
table_id = os.environ.get('BIGQUERY_TABLE', 'latam_analytics_table')

@app.route('/publish', methods=['POST'])
def publish_data():
    try:
        # Capturar el JSON recibido
        data = request.get_json()

        # Validar que las claves esperadas están en el JSON
        if not data or 'data' not in data or not all(k in data['data'] for k in ('id', 'name', 'value')):
            return jsonify({"success": False, "error": "Invalid input data"}), 400

        # Publicar el mensaje en Pub/Sub
        message = json.dumps(data).encode("utf-8")
        future = publisher.publish(topic_path, data=message)
        future.result()

        return jsonify({"success": True, "message": "Message published successfully!"}), 200

    except Exception as e:
        return jsonify({"success": False, "error": str(e)}), 500

@app.route('/insert', methods=['POST'])
def insert_data():
    try:
        # Capturar el JSON recibido
        data = request.get_json()

        # Validar que las claves esperadas están en el JSON
        if not data or 'data' not in data or not all(k in data['data'] for k in ('id', 'name', 'value')):
            return jsonify({"success": False, "error": "Invalid input data"}), 400

        # Crear un cliente de BigQuery
        table_ref = f"{client.project}.{dataset_id}.{table_id}"


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

