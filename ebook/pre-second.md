# 第二版前言

为了满足读者的需求，同时也是我们自身的愿望，我们出版了第二版。尽管解析技术不是快速发展的领域，但是他依然在向前发展。当第一版在1990年出版的时候，当时只有一个初步的并且局限性相当大的线性时间字符串解析算法(algorithm for linear-time substring parsing)。但是发展到现在有多种强大的算法，覆盖了所有确定的语言；我们在第12章对他进行了描述。在1990年，Theorem 8.1诞生于一篇1961年，由Bar-Hillel, Perles, 和Shamir发表的，至今已经落满了灰尘的论文；在过去的十年里，它被用于创建新的算法，并且在现有的算法上得以延伸。我们在第13章中提及此事。

越来越多的非乔姆斯基(non-Chomsky)系统被使用，特别是在语言学上。20年前，除了两级语法之外没有任何建树，如今我们在第15章描述了它们中的六个。长久以来，非标准解析器被认为是很古怪的；如今，它们是我们所拥有的最强大的线性时间解析器(linear-time parsers)之一；见第10章。

虽然还不是很实用，但是奇妙的并行解析算法已被设计，它阐明了新的原理；见第14章。在1990年，广义的LL语法分析器被认为是不可能的；如今在本书的第11章描述了两个广义的LL语法分析器。

历来，不出意料地，解析器已被用于解析；最近它们也被用于代码生成、数据压缩以及逻辑语言实现，如第17.5节所示。够了，读者能够在书目的第18章找到更多的开发案例。

Kees van Reeuwijk曾经半开玩笑地称呼我们的书为“濒危语法分析的保留”。我们同意这种称呼，但是不完全同意，因为它远不止于此，我们受之无愧。在这本书中的几种算法非常有局限性或者只是没有实用价值。我们收录了它们，因为我们觉得它们体现了有趣的想法，并启迪了思维；它们也可能成长并且获得实用价值。但是我们同样包含了许多有实用价值但是很少被用到的算法；在这里提及它们可能改善其在世界的状况。

## 练习和问题

This book is not a textbook in the school sense of the word. Few universities have a course in Parsing Techniques, and, as stated in the Preface to the First Edition, read- ers will have very different motivations to use this book. We have therefore included hardly any questions or tasks that exercise the material contained within this book; readers can no doubt make up such tasks for themselves. The questions posed in the problem sections at the end of each chapter usually require the reader to step outside the bounds of the covered material. The problems have been divided into three not too well-defined classes:

- not marked — probably doable in a few minutes to a couple of hours.
- marked Project — probably a lot of work, but almost certainly doable.
- marked Research Project — almost certainly a lot of work, but hopefully doable.

We make no claims as to the relevance of any of these problems; we hope that some readers will find some of them enlightening, interesting, or perhaps even useful. Ideas, hints, and partial or complete solutions to a number of the problems can be found in Chapter A.

There are also a few questions on formal language that were not answered eas- ily in the existing literature but have some importance to parsing. These have been marked accordingly in the problem sections.