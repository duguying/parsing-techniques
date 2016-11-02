# 2.10 设定上下文无关和正则语言的属性

由于语言是集合，所以很自然会问到集合的标准操作——并集、交集和补集（补充）——是否能用在语言上，如果可以，要怎么做。

*S<sup>1</sup>*和*S<sup>2</sup>*的并集包含两两个集合中的全部元素；写作*S<sup>1</sup>*∪*S<sup>2</sup>*。交集包含了两个集合中的共同元素；写作*S<sup>1</sup>*∩*S<sup>2</sup>*。*S*的补集包含了属于Σ<sup>*</sup>但不属于*S*的元素；写作*$$\rightharpoondown$$S*。在正式语言的上下文中，这些集合是通过语法定义的，所以实际上我们是想要对语法进行操作，而不是语言。

为两种语言的并集构建语法，对上下文无关和正则语言来说是繁琐的（实际上对所有Chomsky类型都是）：仅仅构建一个新的起始符号*S'→S<sup>1</sup>|S<sup>2</sup>*，*S<sup>1</sup>*和*S<sup>2</sup>*是描述两种语言的语法的起始符号。（当然，如果我们想结合两种语言成为一种新的，那我们必须确保他们之中的名字是不同的，不过这是很容易的事情。）

然而交集是另一回事，因为两个上下文无关语言的交集并不一定是上下文无关的，如以下示例所示。有两个语言***L1 = a<sub>n</sub>b<sub>n</sub>c<sub>m</sub>***和***L2 = a<sub>m</sub>b<sub>n</sub>c<sub>n</sub>***，他们由CF语言描述

![图1](../../img/2.10_1.png)

当我们拿到一个同时属于两个语言的字符串放入交集时，就有了**a<sub>p</sub>b<sub>q</sub>c<sub>r</sub>**这种形式，而由于*L<sup>1</sup>*和*L<sup>2</sup>*其中*p = q*以及*q = r*。所以交集中包含**a<sub>n</sub>b<sub>n</sub>c<sub>n</sub>**这样形式的字符串，而我们知道这样的语言不是上下文无关的（见2.7.1节）。

CF语言的交集有一些奇特的属性。第一，两个CF语言的交集总是有一个1型语法——但这个语法却不容易构建。更值得注意的是，三个CF语言的交集比两个的交集要强大的多：Liu 和 Weiner[390]表明，可以获得*k*个CF语言的交集，而不是*k-1*个。除此之外，任何1型语言，甚至任何0型语言，可以通过两个CF语言的交集来构建，我们就能擦除结果字符串中的所有属于*可擦除符号*集中的符号。

我们将用来演示这个惊人现象的CS语言，是由两个相同部分的句子组成的集合：*ww*，*w*是给定字符集中的任何字符串；例如**aa**和**abbababbab**。用来相交的两个语言由以下定义：

![图2](../../img/2.10_2.png)

其中**x**和**y**是可擦出符号。第一个语法生成的字符串由三个部分组成，**a**和**b**的序列*A<sup>1</sup>*，其次是其“黑暗镜像”*M<sup>1</sup>*，**a**对应**x**，**b**对应**y**，再接着是**a**和**b**的一个任意序列*G<sup>1</sup>*。第二个语法生成的字符串包含，**a**和**b**的一个任意序列*G<sup>2</sup>*，一个“黑暗”序列*M<sup>2</sup>*以及它的镜像*A<sup>2</sup>*，其中再次**a**对应**x**，**b**对应**y**。交集强制*A1 =G2, M1 =M2,and G1 =A2* The intersection forces A1 =G2, M1 =M2,and G1 =A2. This makes A2 the mirror image of the mirror image of A1, in other words equal to A1. An example of a string in the intersection is abbabyxyyxabbab,wherewe see the mirror images abbab and yxyyx. We now erase the erasable symbols x and y and obtain our result abbababbab.

Using a massive application of the above mirror-mirror trick, one can relatively easily prove that any Type 0 language can be constructed as the intersection of two CF languages, plus a set of erasable symbols. For details see, for example, Révész [394].

Remarkably the intersection of a context-free and a regular language is always a context-free language, and, what’s more, there is a relatively simple algorithm to construct a grammar for that intersection language. This gives rise to a set of unusual parsing algorithms, which are discussed in Chapter 13.

If we cannot have intersection of two CF languages and stay inside the CF languages, we certainly cannot have negation of a CF language and stay inside the CF languages. If we could, we could negate two languages, take their union, negate the result, and so obtain their intersection. In a formula: L1 ∩L2 = ¬((¬L1) ∪ (¬L2)); this formula is known as De Morgan’s Law.

In Section 5.4 we shall see that union, intersection and negation of regular (Type 3) languages yield regular languages.

It is interesting to speculate what would have happened if formal languages had been based on set theory with all the set operations right from the start, rather than on the Chomsky hierarchy. Would context-free languages still have been invented?