#getting projects with more than 100k commits from mongodb
from pymongo import MongoClient
from bson.json_util import dumps
     
client = MongoClient("mongodb://da1.eecs.utk.edu/")
db = client['WoC']

for v in ["S","T"]:
    coll_name = "P_metadata." + v
    path = "../data/projects_" + v + ".json"
    coll = db[coll_name]
    dataset = coll.find( { "NumCommits": { "$gt": 100000 } } , no_cursor_timeout=True )
    list_dataset = list(dataset)
    json_data = dumps(list_dataset)
    with open(path, 'w') as f:
        f.write(json_data)
    dataset.close()