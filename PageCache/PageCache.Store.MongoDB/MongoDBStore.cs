
using MongoDB.Bson;
using MongoDB.Driver;
using MongoDB.Driver.Builders;



namespace PageCache.Store.MongoDB
{

    public class MongoDBStore :  IStore
    {
        MongoServer server;

        MongoDatabase db;



        public MongoDBStore(string connectionString)
        {

            MongoClient mc = new MongoClient(connectionString);

            server = mc.GetServer();

            db = server.GetDatabase("PageCache");
        }

        string getCollectionName(string key)
        {
            return "data_" + key.Substring(0, 3);
        }


        string getId(string type, string key)
        {
            return type + "-" + key;
        }

        public bool Exists(string type, string key)
        {
            MongoCollection collection = db.GetCollection(getCollectionName(key));

            if (collection.Exists())
            {
                long c = collection.Count(Query.EQ("_id", new ObjectId(getId(type, key))));

                if (c > 0)
                {
                    return true;
                }
            }

            return false;
        }

        public void Save(Store.StoreData data)
        {


            string collectionName = getCollectionName(data.Key);
            MongoCollection collection = db.GetCollection(collectionName);

            if (!collection.Exists())
            {
                CommandResult res = db.CreateCollection(collectionName);

                if (!res.Ok)
                {
                    return;
                }
                else
                {
                    collection = db.GetCollection(collectionName);
                }
            }

            string id = getId(data.Type, data.Key);

            IMongoQuery query = Query.EQ("_id", new ObjectId(id));
            long c = collection.Count(query);

            if (c > 0)
            {

                collection.Remove(query);
            }
            

            BsonDocument document = new BsonDocument();
            document.Set("_id", id);


            document.Set("Type", data.Type);
            document.Set("Key", data.Key);

            document.Set("CreatedDate", data.CreatedDate);
            document.Set("ExpiresAbsolute", data.ExpiresAbsolute);
            document.Set("Seconds", data.Seconds);

            document.Set("HeadersData", data.HeadersData);
            document.Set("BodyData", data.BodyData);

            collection.Save(document);


        }

        public Store.StoreData GetData(string type, string key)
        {
            string collectionName = getCollectionName(key);
            MongoCollection collection = db.GetCollection(collectionName);

            if (collection.Exists())
            {
                string id = getId(type, key);
                Store.StoreData data = collection.FindOneByIdAs<Store.StoreData>(id);

                return data;

            }


            return null;
        }


        public Store.StoreDataInfo GetDataInfo(string type, string key)
        {
           
            string collectionName = getCollectionName(key);
            MongoCollection collection = db.GetCollection(collectionName);

            if (collection.Exists())
            {
                string id = getId(type, key);
                Store.StoreDataInfo info = collection.FindOneByIdAs<Store.StoreDataInfo>(id);

                return info;
            }

            return null;
        }

        public void Delete(string type, string key)
        {
            string collectionName = getCollectionName(key);
            MongoCollection collection = db.GetCollection(collectionName);

            if (collection.Exists())
            {
                string id = getId(type, key);
                IMongoQuery query = Query.EQ("_id", new ObjectId(id));

                collection.Remove(query);
            }

        }


    }



}
