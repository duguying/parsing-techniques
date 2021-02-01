# 问题

**问题5.1**：为5.1.1节中语法*C*的最右侧派生中，句子形式的开放部分构建一个正则语法。

**问题5.2**：图Fig5.7和Fig5.12的FS自动机只有一个可接受状态，但是图Fig5.15（*c*）中的自动机有多个可接受状态。那多重可接受状态是否是必要的？注意：1.是否任何FS自动机*A*都能转换为只有一个可接受状态的FS自动机*B*？2.此外*B*是否不具有ε转换？3.*B*是否是确定性的？

**问题5.3**：展示在清理正则语法时，可以按照任意顺序执行删除非生成性规则和不可到达的非终结符的语法清理操作。

**问题5.4**：设计一种算法，可以从一个FS自动机中删除ε转换。

**问题5.5**：设计一种方法，在正则语法而不是自动机上执行正则自动机（5.5节）的完成和逆向。

**问题5.6**：Problem 5.6: For readers with a background in logic: Taking the complement of the complement of an FSA does not always yield the original automaton, but taking the complement of the complement of an already complemented FSA does, which shows that complemented automata are in some way different. Analyse this phenomenon and draw parallels with intuitionistic logic.

**问题5.7**Problem 5.7: Project: Study the factorization/decomposition of FSAs; see, for example, Roche, [148].

**问题5.8**Problem 5.8: When we assign two states to each non-terminal A, As for “A start” and Af for “A finished, a rule A → XY results in 3 ε-transitions, As →ε Xs, Xf →ε Ys and Yf →ε Af , and a non-ε-transition Xs →X Xf or Ys →Y Yf , depending on whether X or Y is a terminal. Use this view to write a more symmetrical and esthetic account of left- and right-regular grammars than given in Section 5.6.

**问题5.9**Problem 5.9: Derive the subset algorithm from the Earley parser (Section 7.2) working on a left-regular grammar.

**问题5.10**Problem 5.10: Derive a regular expression for S from the grammar of Figure 5.22.

**问题5.11**Problem 5.11: Project: Section 5.7 shows how to minimize a FS automa- ton/grammar by initially assuming all non-terminal are equal. Can a CF grammar be subjected to a similar process and what will happen?

**问题5.12**Problem 5.12: History: Trace the origin of the use of the Kleene star, the raised star meaning “the set of an unbounded number of occurrences”. (See [135].)