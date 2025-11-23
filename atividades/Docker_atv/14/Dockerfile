FROM ubuntu:latest

WORKDIR /app

RUN apt-get update && apt-get install -y python3

COPY process.py .

CMD ["python3", "process.py"]