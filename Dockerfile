FROM python:3.8

RUN apt-get update && \
    apt-get install -y default-libmysqlclient-dev gcc python3-dev

WORKDIR /usr/src/app

COPY requirements.txt ./

RUN pip install -r requirements.txt

COPY db/* .
COPY sql_query.py .

CMD ["python3", "./sql_query.py"]
