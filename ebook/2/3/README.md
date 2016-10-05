# 2.3 语法和语言的Chomsky层次结构

图Fig 2.3和2.5中的语法都很容易理解，而事实上一些简单的短语结构语法可以生成复杂的集合。然而，对于任何一组给定的语法通常都很难说是简单的。（虽然语法有无限的集合，但是在这我们还是说“一个给定集合的语法”。通过一个集合的语法，我们来解释任何做了同样工作的语法，并且不是过于复杂的。）理论上说如果一个集合最终可以生成（例如，通过一个程序），那么它就可以通过一个短语结构语法来生成，不过理论上没有表明这样做很容易，或者说语法是容易理解的。在这一节中要说明Manhattan龟的路劲尽量写出其语法，这些路劲中龟总是不能从起始点向西爬行的。（问题2.3）。

Apart from the intellectual problems phrase structure grammars pose, they also exhibit fundamental and practical problems. We shall see that no general parsing algorithm for them can exist, and all known special parsing algorithms are either very inefficient or very complex; see Section 3.4.2.

The desire to restrict the unmanageability of phrase structure grammars, while keeping as much of their generative powers as possible, has led to the Chomsky hierarchy of grammars. This hierarchy distinguishes four types of grammars, numbered from 0 to 3; it is useful to include a fifth type, called Type 4 here. Type 0 grammars are the (unrestricted) phrase structure grammars of which we have already seen examples. The other types originate from applying more and more restrictions to the allowed form of the rules in the grammar. Each of these restrictions has far-reaching consequences; the resulting grammars are gradually easier to understand and to manipulate, but are also gradually less powerful. Fortunately, these less powerful types are still very useful, actually more useful even than Type 0.

We shall now consider each of the three remaining types in turn, followed by a trivial but useful fourth type.

For an example of a completely different method of generating Type 0 languages see Geffert [395].