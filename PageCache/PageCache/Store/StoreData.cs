using System;

namespace PageCache.Store
{
    [Serializable]
    public class StoreData 
    {
        public string Type { get; set; }
        public string Key { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime ExpiresAbsolute { get; set; }
        public int Seconds { get; set; }


        public byte[] HeadersData { get; set; }
        public byte[] BodyData { get; set; }
    }


}
