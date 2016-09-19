# 第二版前言

为了满足读者的需求，同时也是我们自身的愿望，我们出版了第二版。尽管解析技术不是快速发展的领域，但是他依然在向前发展。当第一版在1990年出版的时候，当时只有一个初步的并且局限性相当大的线性时间字符串解析算法(algorithm for linear-time substring parsing)。但是发展到现在有多种强大的算法，覆盖了所有确定的语言；我们在第12章对他进行了描述。在1990年，Theorem 8.1诞生于一篇1961年，由Bar- Hillel, Perles, 和Shamir发表的，至今已经落满了灰尘的论文；在过去的十年里，它被用于创建新的算法，并且在现有的算法上得以延伸。我们在第13章中提及此事。

越来越多的非乔姆斯基(non-Chomsky)系统被使用，特别是在语言学上。20年前，除了两级语法之外没有任何建树，如今我们在第15章描述了它们中的六个。长久以来，非标准解析器被认为是很古怪的；如今，它们是我们所拥有的最强大的线性时间解析器(linear-time parsers)之一；见第10章。

虽然还不是很实用，但是奇妙的并行解析算法已被设计，它阐明了新的原理；见第14章。在1990年，广义的LL语法分析器被认为是不可能的；如今在本书的第11章描述了两个广义的LL语法分析器。

Traditionally, and unsurprisingly, parsers have been used for parsing; more recently they are also being used for code generation, data compression and logic language implementation, as shown in Section 17.5. Enough. The reader can find more developments in many places in the book and in the Annotated Bibliography in Chapter 18.

Kees van Reeuwijk has — only half in jest — called our book “a reservation for endangered parsers”. We agree — partly; it is more than that — and we make no apologies. Several algorithms in this book have very limited or just no practical value. We have included them because we feel they embody interesting ideas and offer food for thought; they might also grow and acquire practical value. But we also include many algorithms that do have practical value but are sorely underused; describing them here might raise their status in the world.