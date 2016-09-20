在OC中使用组合代替继承的一个demo

需求大概是酱紫的。

项目已经半年多，说要埋点tracking一下，有个基本需求就是对于某些vc要记录appear的时间和disappear时间。
讲道理这事放在vc的基类里写好就是里...
理想总是与现实有差距...
大概差距如下：

1. 有些vc是继承的某第三方库的vc
2. 某些vc中添加里child vc
3. 所有vc都没有title（说白了就是tracking vc要有个名字），对于要tracking的vc要写入title

由此，我希望对于需要tracking的vc不用管，采用协议的方式，加入协议即使得其拥有协议对应的功能，手动填入title，appear和disappear的代码复用一个地方的即可。

首先解决，如何使用默认协议代码？
采用ProcotolKit，实现注入默认协议.https://github.com/forkingdog/ProtocolKit

然后解决，如何侵入实现该协议的vc？
采用runtime，交换方法时候，拦截实现该协议的vc，并调用默认协议的方法

酱紫，如果想给某个vc加入tracking功能，只需要在vc中加入<XXXprocotol>，即附加上tracking功能...代码减少很多，并且无侵入
