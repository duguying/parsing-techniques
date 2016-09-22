# 第二版前言

为了满足读者的需求，同时也是我们自身的愿望，我们出版了第二版。尽管解析技术不是快速发展的领域，但是他依然在向前发展。当第一版在1990年出版的时候，只有一个简单的并且局限性相当大的线性时间字符串解析算法(algorithm for linear-time substring parsing)。但是发展到现在已经有多种可以覆盖所有确定语言的强大的算法；我们将在第12章对这些算法进行详细介绍。在1990年，Theorem 8.1诞生于一篇1961年由Bar-Hillel, Perles, 和Shamir发表的至今已经落满了灰尘的论文；在过去的十年里，Theorem 8.1被用于创建新的算法，并且使现有的算法得到加强。我们在第13章中提及此事。

越来越多的非Chomsky(non-Chomsky)文法的系统被使用，语言学上尤为明显。20年前，除了两级语法之外没有任何建树，而现在却不再是那样，我们在第15章描述了其中6个非Chomsky文法的系统。曾经，非标准解析器被认为是很古怪的；如今，它们是我们所拥有的最强大的线性时间解析器(linear-time parsers)之一，在第10章我们再来说这个。

虽然还不是很实用，但是以另一种方式展现解析原理的奇妙并行解析算法，已经出现在人们的视野中，我们将在第14章详细介绍。在1990年还被认为不可能出现的广义LL语法分析器，现在也已经成为了现实，我们将在第11章介绍其中的2个。

一直以来，解析器都被用于解析；现如今，解析器已经被用于代码生成、数据压缩以及逻辑语言实现等方面，如第17.5节所示。而且，读者还能够在书目的第18章找到更多的开发案例。

Kees van Reeuwijk曾经半开玩笑地称呼我们的书为“濒危语法分析算法最后的栖息地”。我们同意这种说法，但是不完全同意，因为它远不止于此，对于这个说法我们受之无愧。在这本书中收录的的一些算法，它们有非常大的局限性甚至根本没有实用价值。不过我们依旧收录了它们，因为我们觉得这些算法的思路很有意思，并且可以给我们以启迪，并且这些算法还有成长和发展的空间。我们也同样收录了许多有实用价值但是很少被用到的算法，希望将这些算法收录到书中能改变一下它们的现状。

## 练习和问题

这本书不是学校中所谓的教科书。少数大学开设了解析技术的课程，并且，如第一版序言所述，本书并不是只为某一类型的读者所准备。因此，书中几乎没有布置任何习题或作业，读者们可以自己为自己设置一些。章节末尾的问题，只是为了让读者不要陷入书中世界。我们将章节末的问题大致划分为三个类型：

- 无标记型 —— 短时间内可以完成的项目。
- 普通标记型 —— 需要花费一些时间和一些精力来完成的项目。
- 标记未研究型 —— 需要耗费大量时间精力，但目前我们尚未做到的项目。不过我们希望有读者能完成。

对于这些课题我们没有特意使之存在联系性，我们只是希望读者能从中得到启发、乐趣、或任何有用的东西。关于问题的思路、提示、部分或者完整的解决方案，见A章节。

关于正式语言（formal language）也有几个问题，不过我们没有在现有的文献中得到解答，可是却对解析有一定的重要性。这些问题已经在章节末标识出来了。

## 参考文献

第一版中，我们作为作者，阅读分析了所有我们能获得得资料文献。17年后，随着各类出版物得增加，以及互联网带来得查阅便利，查阅分析资料终于不再是一件让我们头疼得事情。在第一版的参考文献中，我们列举了全部的资料。但是在第二版中，尽数列举却不在可能，因为这些文件太多以至于全部列举将会占用远超本书主体内容的空间。在印刷版中，我们只列举了我们引用了原文的资料。我们把完整的参考资料放在了本书的网站中，并且还有我们写的摘要和主题索引。因为建立了网站，我们才能没有顾虑的将全部的文章列举出来，并且可以列举一些平常不太容易获取的资料。网站上的章节是第18章，我们叫做“电子章节”。

本书没有提供URL，有两个原因：首先URL并不稳定，也许过一段时间，这些URL就不在指向我们的资料了；还有，特别是对软件来说，当你在阅读本书的时候也许就有了更好的下载地址。其实我们认为，提供URL还不如提供一些搜索关键字更好，关键字能帮你在搜索引擎上找到你想要的信息。

最近10年里，我们能看到有很多的博士论文使用的不是英语，以德语、发育、西班牙语还有爱沙尼亚语为主。然后很遗憾，这些论文由于语言的选择而难以被科学界所发现。这对相关科学领域以及对作者本人来说，都是一大损失。忽略个人情感，我们得承认，英语是现在科学界的主流语言。在过去的150年时间里，对科学感兴趣的绅士们，在休闲之余会读一些发育、德语、英语、希腊语、拉丁语或者是一点点梵语的东西；但是现在，学生和科学家们则希望花费更多的精力来吸收海量的知识。即便我们能够读懂大部分的上述语言（并非全部）所写的内容，并尽力将这些论文的精华传达给读者，但这仍然不足以让这些论文拥有它们应得的位置。

## 解析技术的未来

If there will ever be a third edition of this book, we expect it to be substantially thinner (except for the bibliography section!). The reason is that the more parsing algorithms one studies the more they seem similar, and there seems to be great opportunity for unification. Basically almost all parsing is done by top-down search with left-recursion protection; this is true even for traditional bottom-up techniques like LR(1), where the top-down search is built into the LR(1) parse tables. In this respect it is significant that Earley’s method is classified as top-down by some and as bottom-up by others. The general memoizing mechanism of tabular parsing takes the exponential sting out of the search. And it seems likely that transforming the usual depth-first search into breadth-first search will yield many of the generalized deterministic algorithms; in this respect we point to Sikkel’s Ph.D thesis [158]. Together this seems to cover almost all algorithms in this book, including parsing by intersection. Pure bottom-up parsers without a top-down component are rare and not very powerful.

So in the theoretical future of parsing we see considerable simplification through unification of algorithms; the role that parsing by intersection can play in this is not clear. The simplification does not seem to extend to formal languages: it is still as difficult to prove the intuitively obvious fact that all LL(1) grammars are LR(1) as it was 35 years ago.

The practical future of parsing may lie in advanced pattern recognition, in addition to its traditional tasks; the practical contributions of parsing by intersection are again not clear.

Amsterdam, Amstelveen Dick Grune
June 2007 Ceriel J.H. Jacobs