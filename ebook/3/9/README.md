# 3.9 Transitive Closure

Many algorithms in parsing (and in other branches of computer science) have the property that they start with some initial information and then continue to draw conclusions from it based on some inference rules until no more conclusions can be drawn. We have seen two examples already, with their inference rules, in Sections 2.9.5.1 and 2.9.5.2. These inference rules were quite different, and in general inference rules can be arbitrarily complex. To get a clear look at the algorithm for drawing conclusions, the closure algorithm, we shall now consider one of the simplest possible inference rules: transitivity. Such rules have the form

if A⊗B and B⊗C then A⊗C

where ⊗ is any operator that obeys the rule. The most obvious one is =, but <, ≤ and many others also do. But note that, for example,  = (not equal) does not.

As an example we shall consider the computation of the “left-corner set” of a non-terminal. A non-terminal B is in the left-corner set of a non-terminal A if there is a derivation A→* B· · · ; it is sometimes useful to know this, because among other things it means that A can begin with anything B can begin with.

Given the grammar

![图1](../../img/3.9_1.png)

how can we find out that C is in the left-corner set of S? The rules S--->ST and S--->Aa in the grammar tell us immediately that S and A are in the left-corner set of S. We write this as S∠S and A∠S, where ∠ symbolizes the left corner. It also tells us A∠T, B∠A, and C∠B. This is our initial information (Figure 3.19(a)).

![图2 Fig.3.19](../../img/3.9_2-Fig.3.19.png)

Now it is easy to see that if A is in the left-corner set of B and B is in the leftcorner set of C, then A is also in the left-corner of C. In a formula:

A∠B ∧ B∠C ⇒ A∠C

This is our inference rule, and we will use it for drawing new conclusions, or “inferences”, by pairwise combining known facts to produce more known facts. The transitive closure is then obtained by applying the inference rules until no more new facts are produced. The facts are also called “relations” in the transitive-closure context, although formally ∠ is the (binary) relation, and A∠B and B∠C are “instances” of that relation.

Going through the list in Figure 3.19(a) we first combine S∠S and S∠S. This yields S∠S, which is rather disappointing since we knew that already; it is in Figure 3.19(b), marked with a ✔ to show that it is not new. The combination (S∠S, A∠S) yields A∠S, but we already knew that too. No other facts combine with S∠S, so we continue with A∠S, which yields A∠S and B∠S; the first is old, the second our first new discovery. Then (A∠T, B∠A) yields B∠T, etc., and the rest of the results of the first round can be seen in Figure 3.19(b).

The second round combines the three new facts with the old and new ones. The first new discovery is C∠S from A∠S and C∠A (c); C∠T follows.

The third round combines the two new facts in (c) with those in (a), (b), and (c), but finds no new facts; so the algorithm terminates with 10 facts.

Note that we have already implemented an optimization in this naive algorithm: the basic algorithm would start the second and subsequent rounds by pairing up all known facts with all known facts, rather than just the new ones.

It is often useful to represent the facts or relations in a graph, in which they are arcs. The initial situation is shown in Figure 3.20(a), the final one in (b). The numbers next to the arrows indicate the rounds in which they were added.

![图3 Fig.3.20](../../img/3.9_3-Fig.3.20.png)

The efficiency of the closure algorithm of course depends greatly on the inference rule it uses, but the case for the transitive rule has been studied extensively. There are three main ways to do transitive closure: naive, traditional, and advanced; we will discuss each of them briefly. The naive algorithm, sketched above, is usually quite efficient in normal cases but may require a large number of rounds to converge in exceptional cases on very large graphs. Also it recomputes old results several times, as we see in Figure 3.19: of the 15 results 10 were old. But given the size of “normal” grammars, the naive algorithm is satisfactory in almost all situations in parsing.

The traditional method to do transitive closure is to use Warshall’s algorithm [409]. It has the advantage that it is very simple to implement and that the time it requires depends only on the number of nodes N in the graph and not on the number of arcs, but it has the disadvantage that it always requires O(N3) time. It always loses in any comparison to any other closure algorithm.

The advanced algorithms avoid the inefficiencies of the naive algorithm: 1. cycles in the graph are contracted as “strongly connected components”; 2. the arcs are combined in an order which avoids duplicate conclusions and allows sets of arcs to be copied rather than recomputed; 3. efficient data representations are used. For example, an advanced algorithm would first compute all outgoing arcs at A and then copy them to T rather than recomputing them for T. The first advanced transitive closure algorithm was described by Tarjan [334]. They are covered extensively in many other publications; see Nuutila [412] and the Internet. They require time proportional to the number of conclusions they draw.

Advanced transitive closure algorithms are very useful in large applications (databases, etc.) but their place in parsing is doubtful. Some authors recommend their use in LALR parser generators but the grammars used would have to be very large for the algorithmic complexity to pay off.

The advantage of emphasizing the closure nature of algorithms is that one can concentrate on the inference rules and take the underlying closure algorithm for granted; this can be a great help in designing algorithms. Most algorithms in parsing are, however, simple enough as to not require decomposition into inference rules and closure for their explanation. We will therefore use inference rules only where they are helpful in understanding (Section 9.7.1.3) and where they are part of the culture (Section 7.3, chart parsing). For the rest we will present the algorithms in narrative form, and point out in passing that they are transitive-closure algorithms.