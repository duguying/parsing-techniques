# 6.4 消除左递归

我们先讨论消除直接左递归的方法。假定&epsilon;-规则和单元规则（unit rule）已经被消除了（见4.2.3.1和4.2.3.2）。现在，令A是一个左递归的非终结符（原文为rule），并且

![图6.4_1](../../img/6.4_1.png)

是A的所有规则。没有等于&epsilon;的&alpha;<sub>i</sub>，否则我们会有A&rarr;A，一个单元规则。也没有等于&epsilon;的&beta;<sub>j</sub>，否则会有一个&epsilon;-规则。A只用A&rarr;A&alpha;<sub>k</sub>规则生成的句型有这样的形式：

![图6.4_2](../../img/6.4_2.png)

并且当A&rarr;&beta;<sub>i</sub>规则使用时，句型不再以A开头，对一些i，和一些k<sub>1</sub>,...,k<sub>j</sub>,它有如下的形式：

![图6.4_3](../../img/6.4_3.png)

这里j可能为0.同样的句型可以被如下规则生成：

![图6.4_4](../../img/6.4_4.png)

或者，使得没有新的&epsilon;规则重新生成的话：

![图6.4_5](../../img/6.4_5.png)

这里A<sub>head</sub>,A<sub>tail</sub>和A<sub>tails</sub>是新引入的非终结符。没有&alpha;<sub>i</sub>是&epsilon;，所以A<sub>tail</sub>不会推导出&epsilon;，所以A<sub>tails</sub>不是左递归。A可能仍然是左递归的，但不是直接左递归，因为没有&beta;<sub>j</sub>以A开始。然而，它们可能推导出以A开始的句型。
一般的，消除间接左递归要更复杂。思路就是先将非终结符标号，标为A<sub>1</sub>,A<sub>2</sub>,...,A<sub>n</sub>.现在，对一个左递归非终结符A，有一个推导

![图6.4_6](../../img/6.4_6.png)

，每时每刻句型的最左边都是非终结符，然后再三地用它的一个右侧替代。每一个非终结符都有一个标号，写作i<sub>1<sub>,i<sub>2<sub>,...,i<sub>m<sub>,于是在推导中我们得到了这么一串数：i<sub>1<sub>,i<sub>2<sub>,...,i<sub>m<sub>,i<sub>1<sub>.现在，如果我们没有任何A<sub>i</sub>&rarr;A<sub>j</sub>&alpha;(j&le;i),这是就不可能的，因为i<sub>1<sub>&lt;i<sub>2<sub>&lt;&dots;&lt;i<sub>m<sub>&lt;i<sub>1<sub>是不可能的。
现在就要消除这样的规则。我们从A<sub>1<sub>开始。对A<sub>1<sub>，要消除了只是直接递归的规则，我们已经看到了应该怎么做。接着轮到A<sub>2<sub>。每一个有着A<sub>2<sub>&rarr;A<sub>1<sub>&alpha;形式的产生式都要被替代成

![图6.4_7](../../img/6.4_7.png)

这里A<sub>1<sub>的规则为

![图6.4_8](../../img/6.4_8.png)

这不可能产生A<sub>2<sub>&rarr;A<sub>1<sub>&gamma;形式的新规则，因为我们已经消除了A<sub>1<sub>的左递归规则，而且&alpha;<sub>i</sub>都不为&epsilon;。接着，我们消除A<sub>2<sub>的直接递归规则。这样对A<sub>2<sub>的工作就结束了。类似的，我们对A<sub>3<sub>到A<sub>n<sub>进行处理，按照总是先替代A<sub>i<sub>&rarr;A<sub>1<sub>&gamma;,再A<sub>i<sub>&rarr;A<sub>2<sub>&delta;等等的顺序。我们必须按照这样的顺序，因为，比如替换一个A<sub>i<sub>&rarr;A<sub>2<sub>&delta;的规则会引入A<sub>i<sub>&rarr;A<sub>3<sub>&gamma;这样的规则，而不会是A<sub>i<sub>&rarr;A<sub>1<sub>&alpha;
