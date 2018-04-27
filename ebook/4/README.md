# 4 一般非定向分析

In this chapter we will present two general parsing methods, both non-directional: Unger’s method and the CYK method. These methods are called non-directional because they access the input in a seemingly arbitrary order. They require the entire input to be in memory before parsing can start.

Unger’s method is top-down; if the input belongs to the language at hand, it must be derivable from the start symbol of the grammar, say S. Therefore, it must be derivable from a right-hand side of the start symbol, say A1A2 · · ·Am. This, in turn, means that A1 must derive a first part of the input, A2 a second part, etc. If the input sentence is t1t2 · · ·tn, this demand can be depicted as follows:

![图1(../../img/4_1.png)

Unger’s method tries to find a partition of the input that fits this demand. This is a recursive problem: if a non-terminal Ai is to derive a certain part of the input, there must be a partition of this part that fits a right-hand side of Ai. Ultimately, such a right-hand side must consist of terminal symbols only, and these can easily be matched with the current part of the input.

The CYK method approaches the problem the other way around: it tries to find occurrences of right-hand sides in the input; whenever it finds one, it makes a note that the corresponding left-hand side derives this part of the input. Replacing the occurrence of the right-hand side with the corresponding left-hand side results in some sentential forms that derive the input. These sentential forms are again the subject of a search for right-hand sides, etc. Ultimately, we may find a sentential form that both derives the input sentence and is a right-hand side of the start symbol.

In the next two sections, these methods are investigated in detail.