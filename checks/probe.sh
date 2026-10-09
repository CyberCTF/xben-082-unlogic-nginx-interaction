#!/bin/sh
# nginx (njs) answers /api/get with the script URL of the API service that the Flask app fetches.
curl -fsS --max-time 10 http://nginx/api/get | grep -q 'http://flask-api:8081/script'
