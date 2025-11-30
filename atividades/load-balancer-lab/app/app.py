from flask import Flask
import socket

app = Flask(__name__)

@app.route('/')
def hello():
    container_id = socket.gethostname()
    return f"Resposta vinda do Container ID: {container_id}\n"

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)