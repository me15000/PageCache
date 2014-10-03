
namespace PageCache.Store
{
    public interface IStore
    {
        bool Exists(string type, string key);
        void Save(StoreData data);
        StoreData GetData(string type, string key);
        StoreDataInfo GetDataInfo(string type, string key);
        void Delete(string type, string key);
    }
}
