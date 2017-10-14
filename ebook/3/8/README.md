# 3.8 When are we done Parsing?

Since non-directional parsers process the entire input at once and summarize it into a single data structure, from which parse trees can then be extracted, the question of when the parsing is done does not really arise. The first stage is done when the data structure is finished; extracting the parse trees is done when they are exhausted or the user is satisfied.

In principle, a directional parser is finished when it is in an accepting state and the entire input has been consumed. But this is a double criterion, and sometimes one of these conditions implies the other; also other considerations often play a role. As a result, for directional parsers the question has a complex answer, depending on a number of factors:

- Is the parser at the end of the input? That is, has it processed completely the last token of the input?

- Is the parser in an accepting state?

- Can the parser continue, i.e, is there a next token and can the parser process it?

- Is the parser used to produce a parse tree or is just recognition enough? In the first case several situations can arise; in the second case we just get a yes/no answer.

- If we want parsings, do we want them all or is one parsing enough?

- Does the parser have to accept the entire input or is it used to isolate a prefix of the input that conforms to the grammar? (A string x is a prefix of a string y if y begins with x.)

The answers to the question whether we have finished the parsing are combined in the following table, where EOI stands for “end of input” and the yes/no answer for recognition is supplied between parentheses.

![图1](../../img/3.8_1.png)

Some answers are intuitively reasonable: if the parser can continue in a nonaccepting state, it should do so; if the parser cannot continue in a non-accepting state, there was an error in the input; and if the parser is in an accepting state at the end of the input and cannot continue, parsing was successful. But others are more complicated: if the parser is in an accepting state, we have isolated a prefix, even if the parser could continue and/or is at EOI. If that is what we want we can stop, but usually we want to continue if we can: with the grammar S--->a|ab and the input ab we could stop after the a and declare the a a prefix, but it is very likely we want to continue and get the whole ab parsed. This could be true even if we are at EOI: with the grammar S--->a|aB where B produces ε and the input a we need to continue and parse the B, if we want to obtain all parsings. And if the parser cannot, we have recognized a string in the language with what error messages usually call “trailing garbage”.

Note that “premature EOI” (the input is a prefix of a string in the language) is the dual of “prefix isolated” (a prefix of the input is a string in the language). If we are looking for a prefix we usually want the longest possible prefix. This can be implemented by recording the most recent position P in which a prefix was recognized and continuing parsing until we get stuck, at the end of the input or at an error. P is then the end of the longest prefix.

Many directional parsers use look-ahead, which means that there must always be enough tokens for the look-ahead, even at the end of the input. This is implemented by introducing an end-of-input token, for example # or any other token that does not occur elsewhere in the grammar. For a parser that uses k tokens of look-ahead, k copies of # are appended to the input string; the look-ahead mechanism of the parser is modified accordingly; see for example Section 9.6. The only accepting state is then the state in which the first # is about to be accepted, and it always indicates that the parsing is finished.

This simplifies the situation and the above table considerably since now the parser cannot be in an accepting state when not at the end of the input. This eliminates the two prefix answers from the table above. We can then superimpose the top half of the table on the bottom half, after which the leftmost column becomes redundant. This results in the following table:

![图2](../../img/3.8_2.png)

where we leave the check to distinguish between “error in input” and “premature EOI” to the error reporting mechanism.

Since there is no clear-cut general criterion for termination in directional parsers, each parser comes with its own stopping criterion, a somewhat undesirable state of affairs. In this book we will use end-of-input markers whenever it is helpful for termination, and, of course, for parsers that use look-ahead.