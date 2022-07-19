bind = "0.0.0.0:8000"
workers = 2
accesslog = 'docker/gunicorn/logs/access.log'
errorlog = 'docker/gunicorn/logs/error.log'
worker_tmp_dir = '/dev/shm'
