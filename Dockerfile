FROM python:3.7-slim
ENV DEBUG_MODE False
COPY requirements.txt .
RUN pip3 install -r requirements.txt
RUN pip3 install gunicorn==20.0.4
COPY vtescards/ /usr/local/app/
WORKDIR /usr/local/app/
CMD python3 manage.py migrate && gunicorn -w 2 -b 0.0.0.0:8000 vtescards.wsgi