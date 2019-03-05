import os
import urllib.request
from celery import Celery

app = Celery()

app.conf.broker_url = os.getenv('CELERY_BROKER_URL', 'rabbitmq')
app.conf.result_backend = os.getenv('CELERY_BACKEND_URL', 'sentinel://redis-proxy:26379/0')
app.conf.result_backend_transport_options = os.getenv('CELERY_BACKEND_TRANSPORT_OPTIONS', "{ 'master_name': 'redismaster' }")

@app.task
def add(x, y): return x + y

if __name__ == '__main__':
    app.worker_main()
