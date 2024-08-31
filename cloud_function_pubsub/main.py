from google.cloud import bigquery
import base64
import json

def process_pubsub_message(event, context):
    # Obtener el mensaje de Pub/Sub
    message = base64.b64decode(event['data']).decode('utf-8')
    data = json.loads(message)

    # Configurar el cliente de BigQuery
    client = bigquery.Client()
    dataset_id = "latam_analytics_dataset"
    table_id = "latam_analytics_table"
    table_ref = client.dataset(dataset_id).table(table_id)

    # Insertar los datos en BigQuery
    rows_to_insert = [{
        "data_id": data["data"]["id"],
        "data_name": data["data"]["name"],
        "data_value": data["data"]["value"]
    }]

    errors = client.insert_rows_json(table_ref, rows_to_insert)

    if errors:
        print(f"Error inserting rows: {errors}")
    else:
        print("Data inserted successfully")

