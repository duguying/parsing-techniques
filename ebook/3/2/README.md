# 3.2 解析一个句子的两种方法

一个句子和其起源的语法之间的基本联系就是解析树，解析树描述了语法是如何生成一个句子的。 为了这种连接的重建，我们需要一种解析技术。当我们查阅解析技术方面的文档时，我们似乎找到了几十个，不过却只有两个是解析方面的；其余的都是技术细节和点缀。

The first method tries to imitate the original production process by rederiving the sentence from the start symbol. This method is called top-down, because the parse tree is reconstructed from the top downwards.[^1]

The second method tries to roll back the production process and to reduce the sentence back to the start symbol. Quite naturally this technique is called bottom-up.

[^1]: Trees grow from their roots downwards in computer science; this is comparable to electrons having a negative charge in physics.