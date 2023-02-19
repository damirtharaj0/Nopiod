from flask import Flask, request
import gpt3api
import db

app = Flask(__name__)

@app.route("/search", methods=['GET'])
def search():
    text = request.args
    return {'result' : gpt3api.search(text['text'])}

@app.route("/location", methods=['GET'])
def location():
    text = request.args
    print({'result' : db.getCoordinates()})
    return {'result' : db.getCoordinates()}