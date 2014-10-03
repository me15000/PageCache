using System;

namespace PageCache.Store
{
    public class StoreDataInfo
    {
        public string Type { get; set; }
        public string Key { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime ExpiresAbsolute { get; set; }
        public int Seconds { get; set; }
    }

}
