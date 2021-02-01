# Problems

Problem 5.1: Construct the regular grammar for open parts of sentential forms in rightmost derivations for the grammar C in Section 5.1.1.

Problem 5.2: The FS automata in Figures 5.7 and 5.12 have only one accept- ing state, but the automaton in Figure 5.15(c) has several. Are multiple accepting states necessary? In particular: 1. Can any FS automaton A be transformed into an equivalent single accepting state FS automaton B? 2. So that in addition B has no ε-transitions? 3. So that in addition B is deterministic?

Problem 5.3: Show that the grammar cleaning operations of removing non- productive rules and removing unreachable non-terminals can be performed in either order when cleaning a regular grammar.

Problem 5.4: Design an algorithm for removing ε-transitions from a FS automa- ton.

Problem 5.5: Design a way to perform the completion and negation of a regular automaton (Section 5.5) on the regular grammar rather than on the automaton.

Problem 5.6: For readers with a background in logic: Taking the complement of the complement of an FSA does not always yield the original automaton, but taking the complement of the complement of an already complemented FSA does, which shows that complemented automata are in some way different. Analyse this phenomenon and draw parallels with intuitionistic logic.

Problem 5.7: Project: Study the factorization/decomposition of FSAs; see, for example, Roche, [148].

Problem 5.8: When we assign two states to each non-terminal A, As for “A start” and Af for “A finished, a rule A → XY results in 3 ε-transitions, As →ε Xs, Xf →ε Ys and Yf →ε Af , and a non-ε-transition Xs →X Xf or Ys →Y Yf , depending on whether X or Y is a terminal. Use this view to write a more symmetrical and esthetic account of left- and right-regular grammars than given in Section 5.6.

Problem 5.9: Derive the subset algorithm from the Earley parser (Section 7.2) working on a left-regular grammar.

Problem 5.10: Derive a regular expression for S from the grammar of Figure 5.22.

Problem 5.11: Project: Section 5.7 shows how to minimize a FS automa- ton/grammar by initially assuming all non-terminal are equal. Can a CF grammar be subjected to a similar process and what will happen?

Problem 5.12: History: Trace the origin of the use of the Kleene star, the raised star meaning “the set of an unbounded number of occurrences”. (See [135].)