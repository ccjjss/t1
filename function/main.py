# main.py

from google.cloud import bigquery

def get_data(request):
    client = bigquery.Client()
    query = "SELECT * FROM `latam-project.latam_analytics_dataset.latam_analytics_table` LIMIT 10"
    query_job = client.query(query)
    results = query_job.result()
    rows = [dict(row) for row in results]
    return {"data": rows}

