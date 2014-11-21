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
- 新增读取队列，把最新从磁盘中读取的内容加入内存缓冲区，当再次有进程读取时，不用从磁盘读，减少磁盘IO
- 新增SQLite 存储器，使用本地文件和磁盘来保存缓存内容，减少网络开销和维护成本
- 程序结构优化


## PageCache 简要说明 ##

顾名思义 PageCache 是用来缓存网页的 ，如 php 页面、 html、 asp页面、asp.net 页面等等，也可以缓存图片、css、js 等

可以用来做反向代理服务器

功能有点类似CDN


## PageCache可以带来的好处 ##

*   PageCache 可以在不修改源代码的情况下，将动态页面模拟为静态页面，提升网页打开速度，增强用户体验
*   PageCache  支持gzip压缩和分片，将源页面压缩为gzip 发送给用户，减小网页的体积，节约带宽 增强用户体验
*   PageCache 可以自动计算出 用户频繁访问的页面，将此页面放入内存，减少磁盘读写，提升网站的并发性能
*   PageCache 有很强的可伸缩性，可以创建多个节点，多个存储来进一步提升网站性能 ，支持负载均衡
*   使用PageCache 可以让注重网站性能的用户，不再为性能而做过多的工作，从而提升工作效率，降低产品开发周期，让开发者更关注需求本身
*   如果网站使用 dnspod 解析多台服务器，架构多台PageCache服务器，基本上可以做到类似 CDN页面加速功能，为项目节约成本	



## PageCache详细说明 ##

**场景：**

网站访问量比较大的时候，一个问题就凸显出来，网站的性能（网页的打开速度）

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



	<?xml version="1.0" encoding="utf-8" ?>
	<!--
	PageCache     配置文件
	
	enable        是否启用 pageCache
	readOnly      是否设置为只读模式，设置为只读模式之后，不再重新生成缓存
	typePrefix    缓存前缀
	refreshKey    刷新用的key
	errorLogPath  错误日志目录  如果为空则不创建错误日志
	accessLogPath 访问日志目录  如果为空则不创建访问日志
	
	netReceiveTimeout 获取源页面数据超时时间
	netSendTimeout    获取源页面发送等待时间
	headersFilters    过滤源页面输出的 http头
	
	storeBufferSize   存储队列缓冲区大小
	
	-->
	
	<pageCache
	 
		enable="true"
		readOnly="true"
		typePrefix="mm"
		refreshKey="__refresh__"
		errorLogPath="E:\PageCache\ErrorLog\"
		accessLogPath="E:\PageCache\AccessLog\"
		netReceiveTimeout="10"
		netSendTimeout="3"
		headersFilters="X-"
	  storeBufferSize="100">
	
	  <!--
	  对应状态码默认的缓存时长（秒钟）  
	  
	  200 状态缓存 3600 秒
	  400-599 状态缓存 0秒
	  其它的缓存 1800 秒
	  -->
	  <expires>
	    <expire code="*" seconds="1800" />
	    <expire code="400-599" seconds="0" />
	    <expire code="200" seconds="3600" />
	  </expires>
	
	  <!--
	  各种存储器
	  可以使用 mysql存储器 sqlite sqlserver mongodb 等也可以混合使用
	  这里
	  -->
	  <stores>
	
	    <!--<store name="db1" weight="50" connectionString="Server=localhost;Database=pagecache;Uid=root;Pwd=123456;" assemblyName="PageCache.Store.MySql, Version=1.0.0.0, Culture=neutral, PublicKeyToken=a91d1f4aebf531e6" fullTypeName="PageCache.Store.MySql.MySqlStore" />-->
	
	
	    <!--
	    sqlite  存储器
	    name    是存储器的唯一标示
	    weight  权重，当有多个存储器的时候有效，数值在 0-100之间，表示访问到此存储器的几率
	    connectionString 是链接字符串，这里是sqlite 存储器，使用的是文件所在路径
	    assemblyName    是程序集的强名称
	    fullTypeName    是类型名称
	    -->
	    <store name="db2" weight="100" connectionString="H:\PageCache" assemblyName="PageCache.Store.SQLite, Version=1.0.0.0, Culture=neutral, PublicKeyToken=a91d1f4aebf531e6" fullTypeName="PageCache.Store.SQLite.SQLiteStore" />
	
	
	  </stores>
	
	
	  <!--
	    源主机组可以有多个
	  -->
	
	  <hosts>
	
	    <!--
	    默认源主机，生成缓存的时候 会请求源主机 获得网页内容，然后保存到 存储器中，再发送给 用户
	    用户再次访问的时候，不再访问源主机
	    
	    name  源主机唯一标示
	    domain  要发送的域名，可以为空
	    scheme  协议，可以使 http https 等
	    -->
	    <host name="default" domain="localhost" scheme="http">
	
	      <!--
	      可以定义多个源，
	      weight  权重，当有多个多个源的时候有效，数值在 0-100之间，表示访问到此源的几率
	      -->
	      
	      <address name="local" weight="20" ip="127.0.0.1" port="80" />
	      <address name="s1" weight="20" ip="127.0.0.1" port="80" />
	      <address name="s2" weight="20" ip="127.0.0.1" port="80" />
	    </host>
	  </hosts>
	
	
	  <!--
	  内存缓存规则
	  clearSeconds  多久进行一次清理 （秒）
	  removeSeconds 缓存保存时长（秒）
	  queueCount    当请求并发达到此数值之后，设置为内存缓存
	  capacity      内存缓存容量
	  -->
	  <memoryRule clearSeconds="5" removeSeconds="5" queueCount="3" capacity="256" />
	
	  <!--
	  url 监控规则
	  
	  -->
	  <rules>
	    <!--
	    name    规则名称
	    match   正则表达式 匹配要缓存的url
	    action  映射到的相对地址
	    host    对应的源主机标示，默认default   对应节点 pageCache > hosts > host[name=default]
	    cacheSeconds  缓存时长（秒）
	    -->
	    <rule name="test" match="test(\d+)" action="/default.aspx" host="default" cacheSeconds="600">
	      <!--
	      此 url 需要接收的参数      
	      type 标示类型，可以使 GET POST HEADER 
	      value 是默认值 可以使用 match 匹配到的参数 
	      $1 表示第一个括号匹配到的内容
	      pattern 标示正则，如果接收到的参数值 匹配到该正则，则发送给源页面
	      -->
	      <params>
	        <param name="id" type="GET" value="$1" />
	        <param name="idpost" type="POST" value="$1" />
	        <param name="idheader"  type="HEADER" value="$1" />
	        <param name="User-Agent" type="HEADER" pattern="(mac|android)" ignoreCase="true" />
	      </params>
	    </rule>
	
	
	  </rules>
	</pageCache>