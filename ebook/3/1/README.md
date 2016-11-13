# 3.1 解析树

关于重建解析树有两个重要的问题：我们为什么需要它；我们如何实现它。

恢复生成树的需求是不自然的。毕竟，语法是一组字符串的凝聚态描述，既语言，并且也许我们的输入字符串可能属于或者不属于这个语言；没有涉及内部结构或生成路劲。如果我们坚持这个正式观点， If we adhere to this formal view, the only meaningful question we can ask is if a given string can be recognized according to a grammar; any question as to how would be a sign of senseless, even morbid curiosity. In practice, however, grammars have semantics attached to them: specific semantics is attached to specific rules, and in order to determine the semantics of a string we need to find out which rules were involved in its production and how. In short, recognition is not enough, and we need to recover the production tree to get the full benefit of the syntactic approach.

The recovered production tree is called the parse tree. The fact that it is next to impossible to attach semantics to specific rules in Type 0 and Type 1 grammars explains their relative unimportance in parsing, compared to Types 2 and 3.

How we can reconstruct the production tree is the main subject of the rest of this book.