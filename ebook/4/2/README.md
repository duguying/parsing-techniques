# 4.2 The CYK Parsing Method

The parsing method described in this section is attributed to J. Cocke, D.H. Younger, and T. Kasami, who independently discovered variations of the method; it is now known as the Cocke-Younger-Kasami method, or the CYK method. The most accessible original description is that of Younger [10]. An earlier description is by Sakai [5].

As with Unger’s parsing method, the input to the CYK algorithm consists of a CF grammar and an input sentence. The first phase of the algorithm constructs a table telling us which non-terminal(s) derive which substrings of the sentence. This is the recognition phase; it ultimately also tells us whether the input sentence can be derived from the grammar. The second phase uses this recognition table and the grammar to construct all possible derivations of the sentence.

We will first concentrate on the recognition phase, which is the distinctive feature of the algorithm.