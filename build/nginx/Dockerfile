# Overlay of the benchmark's nginx/Dockerfile (that folder is vendored unchanged in app/, moved here from build/flask-app/app/nginx/).
# What differs from upstream:
# - the COPY sources point into app/ (this folder is the build context);
# - the host names flask_app and flask_api (upstream's service names) are written flask-app and flask-api,
#   the machines' names (Isoloom names are DNS labels, no underscores), in nginx.conf, the API URL and the pages.
# Everything else is upstream's, line for line.

FROM nginx:alpine

RUN apk add --no-cache nginx-module-njs

RUN echo "'Cocomelon'" > /tmp/name
RUN echo -n "http://flask_api:8081/script" > /tmp/apiurl
RUN chmod 777 /tmp/name /tmp/apiurl

COPY app/html /html
COPY app/nginx.conf /etc/nginx/nginx.conf
COPY app/conf.d/ /etc/nginx/conf.d/

# This lab: the Flask machines are flask-app and flask-api (upstream: flask_app, flask_api).
RUN sed -i 's/flask_app/flask-app/g; s/flask_api/flask-api/g' /etc/nginx/nginx.conf /tmp/apiurl /html/*.html /html/script.js
