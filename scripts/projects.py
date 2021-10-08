#getting projects with more than 100k commits from mongodb
import pymongo
import bson
     
client = pymongo.MongoClient("mongodb://da1.eecs.utk.edu/")
db = client ['WoC']

for v in ["S","T"]:
    coll_name = "P_metadata." + v
    path = "../data/projects." + v
    coll = db[coll_name]
    dataset = coll.find( { "NumCommits": { "$gt": 100000 } } , no_cursor_timeout=True )
    with open(path, 'w') as f:
        for data in dataset:
            print >> f, data
    dataset.close()