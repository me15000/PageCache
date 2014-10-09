# PageCache #

**第五个版本**

----------



模拟静态页面、页面静态化、提升动态页面性能



> 通过不断的测试 日志分析 用户反馈，PageCache 已经发展到第五个版本，
> 目前已经稳定运行在生产环境中。




- PageCache 新特性
- PageCache 简要说明
- PageCache 可以带来的好处
- PageCache 详细说明
- PageCache 原理
- PageCache 怎么使用

## PageCache 新特性 ##

- 新增存储队列，把要存储到磁盘上的内容先写入内存缓冲区，到达一定的数量之后一次性写入磁盘，减少磁盘IO
- 新增读取队列，把最新从磁盘中读取的内容加入内存缓冲区，减少磁盘IO
- 新增SQLite 存储器，使用本地文件和磁盘来保存缓存内容，减少网络开销和维护成本，适合小型项目
- 程序结构优化


## PageCache 简要说明 ##

顾名思义 PageCache 是用来缓存网页的 ，如 php 页面、 html、 asp页面、asp.net 页面等等，也可以缓存图片、css、js 等


## PageCache可以带来的好处 ##

*   PageCache 可以在不修改源代码的情况下，将动态页面模拟为静态页面，提升网页打开速度，增强用户体验
*   PageCache  支持gzip压缩和分片，将源页面压缩为gzip 发送给用户，提升网页打开速度，增强用户体验
*   PageCache 可以自动计算出 用户频繁访问的页面，将此页面放入内存，提升网页打开速度
*   PageCache 有很强的可伸缩性，可以创建多个节点，多个存储来进一步提升网站性能 ，支持负载均衡
*   使用PageCache 可以让注重网站性能的用户，不再为性能而做过多的工作，从而提升工作效率，降低产品开发周期，让开发者更关注需求本身
*   如果网站使用 dnspod 解析多台服务器，架构多台PageCache服务器，基本上可以做到类似 CDN 的页面加速功能，为项目节约成本	



## PageCache详细说明 ##

**场景：**

网站访问量比较大的时候，一个问题就凸显出来，网站的性能（网站的响应速度）

为了解决性能问题，传统解决方案：


- 生成静态HTML
- 使用Redis or memcached 等其它缓存软件


【生成静态HTML】优点

1. 打开速度快，不访问数据库，所以很多网站使用生成静态HTML 来提升性能，
 在网站规模比较小改动幅度比较小的情况下，这种方法还不错。

2. 网站数据库在挂了的情况下 静态HTML 仍然可以对外访问




【生成静态HTML】缺点

1. 因为如果网站要生成静态HTML，网站就要有写入权限，有写入权限对网站来说是很不安全的
2. 生成静态HTML 在程序实现上有诸多不便，严重影响开发效率，耽误产品开发进度
3. 网站频繁修改、网站数据量上十万 二十万的情况下、网站有成千上万上几十万上百万个页面构成，生成静态HTML 非常耗时麻烦
4. 网站迁移备份由于目录中静态HTML 太多，需要打包网络传输过去 这个过程是很麻烦很漫长的	


【使用 Redis or memcached】



在使用 Redis 或者 memcached 这些软件的时候

程序上要多一层，会增加开发周期，会增加维护成本

因为Redis 或 memcached 和 程序的耦合性比较大

会导致程序员的工作量增加


> Redis 或 memcached 在项目中的角色：
> 
> 程序第一次读数据的时候 ，首先要从**数据库**中取出数据，然后把数据存储到 Redis 或 memcached 中，并设置过期时间
> 
> 第二次再去读数据的时候，就直接从 memcached 或 redis 中读数据，不用直接再从数据库中读数据
> 
> 当memcached 或 redis 中的数据过期的时候，再重复上述的步骤




## 更好的解决方案**【PageCache】** ##

- PageCache 尽可能模拟到【静态HTML】的性能，甚至超越【静态HTML】的性能的情况下，保留静态HTML的优点，解决静态HTML的缺点

- PageCache 拥有多种存储引擎，可以使用传统数据库 mysql、 mssql、 oracle、 本地磁盘等，作为缓存存储引擎，也可以使用 redis、 mongodb、 memcached 等作为存储引擎

- PageCache 有良好的存储引擎扩展机制，可以指定规则使用多种不同的存储引擎 解决性能问题

- PageCache 独立于应用程序，降低程序耦合性，程序员不用使用 redis memcached 等中间件，更关注程序逻辑提升工作效率





## PageCache原理 ##


PageCache 将动态页面执行的结果保存了起来，并指定过期时间，到了过期时间之后，再重新获得动态页面的结果，

在缓存没有过期之前，用户访问的都是这个缓存的结果，这样就可以提升网站的性能，不用再去手工生成页面

PageCache可以设定使用内存缓存，自动计算出哪些缓存被频繁访问，然后把这个缓存 放入到内存中，这样可以减少磁盘IO，从而更进一步提升性能

PageCache 通过Http形式获得动态页面的执行结果，这样意味着，动态页面可以放在本地服务器，也可以放在远程，也可以架构多台动态页面服务器，提升性能

PageCache 并不直接把数据放到存储引擎里面，而是缓存到一个内存列表中，当列表中元素数量达到设定值之后，再写入存储引擎中，从而提升存储引擎的性能






## PageCache怎么使用 ##

PageCache 基于.net 开发，所以 PageCache 需要依赖微软 .net framework  

*windows 2008 + iis 7.x 配置说明*

PageCache要用到的文件

- PageCache.dll 主程序
- PageCache.Store.xxxxxxx.dll 存储器程序
- PageCache.config   配置文件 
- Web.config  配置文件



存储器可以有多种选择，也可以定制、默认PageCache自带的存储器有
 
- MySql存储器(PageCache.Store.MySql.dll)
- SQLServer存储器(PageCache.Store.SQLServer.dll)
- MongoDB存储器(PageCache.Store.MongoDB.dll)

存储器实现了接口 PageCache.Store.IStore 接口，用户需要定制存储器可以实现这个接口，

用户可以根据自己的需要来选择需要的存储器


*详细配置可以参考程序目录 PageCacheWeb 中的配置*
