import pymongo
from pymongo import MongoClient


def getCoordinates():
    username = 'sauceque'
    password = 'oYwbpCXtdoR628Qe'
    client = pymongo.MongoClient(
        f'mongodb+srv://{username}:{password}@cluster0.b7qtc4h.mongodb.net/?retryWrites=true&w=majority')
    db = client['Locations']
    locations = db['Locations']

    return list(locations.find({}, {'_id': 0}))
