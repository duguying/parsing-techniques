# 3.8 什么时候才是完成了解析呢？

由于非决定性解析器是一次性处理整个输入字符串，并将其汇总到一个单一的数据结构中，然后可以从中提取出解析树，那么何时能完成解析的问题就不大会出现了。当数据结构完成后，第一阶段就完成了；而提取解析树是在数据结构用完之后或者用户满意就完成了。

原则上，一个定向解析器处于接受状态而所有的输入都已经结束，就是完成了。但这本来是重复要求的，有时其中一个条件就蕴含了另外一个；并且通常其他条件会起同样的作用。因此，对定向解析器来说，这个答案很复杂，取决于很多因素:

- 解析器是否在输入的末尾？就是说，它是不是处理完了输入的最后一个符号？

- 解析器是否处于可接受状态？

- 解析器是否可以继续，例如，如果有下一个字符，解析器是不是能继续处理它？

- 解析器是用来生成解析树的还是只是作为一个识别？第一种可能出现几种不同情况；第二种的话我们的答案只会是是/否。

- 如果我们想要解析数，那是想要全部的解析树还是一个就够了呢？

- 解析器必须要接受整个输入，还是用符合语法的合适的隔离符来进行分割？（如果有一个字符串x，是另一个字符串y的开头部分，那x就是一次分割。）

关于我们是否完成了解析的问题的答案，在下表有了对照，其实EOI代表“输入结束”，yes/no代表对选项的回答。

![图1](../../img/3.8_1.png)

有些答案在直觉上是合理的：如果解析器持续保持在不接受输入的状态下，它应该这样做；如果解析器不能保持在不接受输入的状态，那么输入中存在错误；并且如果解析器在输入结束时仍旧保持可接受状态，那么解析就成功了。但另一些情况要更复杂：如果解析器是在处于可接受状态，我们就会隔离一个前缀，Some answers are intuitively reasonable: if the parser can continue in a nonaccepting state, it should do so; if the parser cannot continue in a non-accepting state, there was an error in the input; and if the parser is in an accepting state at the end of the input and cannot continue, parsing was successful. But others are more complicated: if the parser is in an accepting state, we have isolated a prefix, even if the parser could continue and/or is at EOI. If that is what we want we can stop, but usually we want to continue if we can: with the grammar S--->a|ab and the input ab we could stop after the a and declare the a a prefix, but it is very likely we want to continue and get the whole ab parsed. This could be true even if we are at EOI: with the grammar S--->a|aB where B produces ε and the input a we need to continue and parse the B, if we want to obtain all parsings. And if the parser cannot, we have recognized a string in the language with what error messages usually call “trailing garbage”.

Note that “premature EOI” (the input is a prefix of a string in the language) is the dual of “prefix isolated” (a prefix of the input is a string in the language). If we are looking for a prefix we usually want the longest possible prefix. This can be implemented by recording the most recent position P in which a prefix was recognized and continuing parsing until we get stuck, at the end of the input or at an error. P is then the end of the longest prefix.

Many directional parsers use look-ahead, which means that there must always be enough tokens for the look-ahead, even at the end of the input. This is implemented by introducing an end-of-input token, for example # or any other token that does not occur elsewhere in the grammar. For a parser that uses k tokens of look-ahead, k copies of # are appended to the input string; the look-ahead mechanism of the parser is modified accordingly; see for example Section 9.6. The only accepting state is then the state in which the first # is about to be accepted, and it always indicates that the parsing is finished.

This simplifies the situation and the above table considerably since now the parser cannot be in an accepting state when not at the end of the input. This eliminates the two prefix answers from the table above. We can then superimpose the top half of the table on the bottom half, after which the leftmost column becomes redundant. This results in the following table:

![图2](../../img/3.8_2.png)

where we leave the check to distinguish between “error in input” and “premature EOI” to the error reporting mechanism.

Since there is no clear-cut general criterion for termination in directional parsers, each parser comes with its own stopping criterion, a somewhat undesirable state of affairs. In this book we will use end-of-input markers whenever it is helpful for termination, and, of course, for parsers that use look-ahead.