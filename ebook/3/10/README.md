### 3.10 The Relation between Parsing and Boolean Matrix Multiplication

There is a remarkable and somewhat mysterious relationship between parsing and Boolean matrix multiplication, in that it is possible to turn one into the other and vice versa, with a lot of ifs and buts. This has interesting implications.

A Boolean matrix is a matrix in which all entries are either 0 or 1. If the indexes of amatrix T represent towns, the element Ti, j could, for example, indicate the existence of a direct railroad connection from town i to town j. Such a matrix can be multiplied by another Boolean matrix Uj,k, which could, for example, indicate the existence of a direct bus connection from town j to town k. The result Vi,k (the product of T and U) is a Boolean matrix which indicates if there is a connection from town i to town k by first using a train and then a bus. This immediately shows how Vi,k must be computed: it should have a 1 if there is a j for which both Ti, j and Uj,k hold a 1, and a 0 otherwise. In a formula:

Vi,k = (Ti,1 ∧U1,k)∨(Ti,2 ∧U2,k)∨· · ·∨(Ti,n ∧Un,k)

where ∧ is the Boolean AND, ∨ is the Boolean OR, and n is the size of the matrices. This means that O(n) actions are required for each entry in V, of which there are n2; so the time dependency of this algorithm is O(n3).

Figure 3.21 shows an example; the boxed row T2,∗ combines with the boxed column U∗,2 to produce the boxed entry V2,2. Boolean matrix multiplication is not commutative: it is quite possible that there is a train-bus connection but no bus-train connection from one town to another, so T ×U will in general not be equal toU ×T. Note also that this differs from transitive closure: in transitive closure a single relation is followed an unbounded number of times, whereas in Boolean matrix multiplication first one relation is followed and then a second.

![图1 Fig3.21](../../img/3.10_1-Fig.3.21.png)

The above is a trivial application of Boolean matrix multiplication (BMM), but BMM is very important in many branches of mathematics and industry, and there is a complete science on how to perform it efficiently[^1]. Decades of concentrated effort have resulted in a series of increasingly more efficient and complicated algorithms. V. Strassen[^2] was the first to break the O(n3) barrier with an O(n2.81···) algorithm, and the present record stands at O(n2.376···); it dates from 1987. It is clear that at least O(n2) actions are required, but it is unlikely that that efficiency can be achieved.

More important from our viewpoint is the fact that in 1975 Valiant [18] showed how a CF parsing problem can be converted into a BMM problem. In particular, if you can multiply two Boolean matrices of size n×n in O(nk) actions, you can parse a string of length n in O(nk)+O(n2) actions, where the O(n2) is the cost of the conversion. So we can do general CF parsing in O(n2.376···), which is indeed better than the cubic time dependency of the CYK algorithm. But the actions of both Valiant’s algorithm and the fast BMM are extremely complicated and timeconsuming, so this approach would only be better for inputs of millions of symbols or more. On top of that it requires all these symbols to be in memory, as it is a nondirectional method, and the size of the data structures it uses is O(n2), which means that it can only be run profitably on a machine with terabytes of main memory. In short, its significance is theoretical only.

In 2002 Lee [39] showed how a BMM problem can be converted into a CF parsing problem. More in particular, if you can do general CF parsing of a string of length n in O(n3−δ) action , you can multiply two Boolean matrices of size n×n in O(n3−δ/3) actions. There is again a conversion cost of O(n2), but since δ can be at most 2 (in which unlikely case parsing could be done in O(n)), O(n3−δ/3) is at least O(n213 ), which dominates the O(n2); note that for δ = 0 the usual O(n3) bounds for both problems result. The computational efforts involved in Lee’s conversion are much smaller than those in Valiant’s technique, so a really fast general CF parsing algorithm would likely supply a fast practical BMM algorithm. Such a fast general CF parsing algorithm would have to be non-BMM-dependent and have a time complexity better than O(n3); unfortunately no such algorithm is known.

General CF parsing and Boolean matrix multiplication have in common that the efficiencies of the best algorithms for them are unknown. Figure 3.22 summarizes the possibilities. The horizontal axis plots the efficiency of the best possible general CF parsing algorithm; the vertical axis plots the efficiency of the best possible BMM algorithm. A position in the graph represents a combination of these values. Since these values are unknown, we do not know which point in the graph corresponds to reality, but we can exclude several areas.

![图1 Fig3.22](../../img/3.10_2-Fig.3.22.png)

The grey areas are excluded on the grounds of existing algorithms. For example, the grey area on the right of the vertical line at n3 is excluded because we have the CYK algorithm, which does general CF parsing in O(n3); so the pair (best parser, best BMM) cannot have a first component which is larger than O(n3). Likewise the area left of the vertical line at n1 represents parsing algorithms that work in less than O(n), which is impossible since the parser must touch each token. BMM requires at least O(n2) actions, but an algorithm for O(n2.376···) is available; this yields two horizontal forbidden areas.

The shading marks the areas that are excluded by the Valiant and Lee conversion algorithms. Valiant’s result excludes the horizontally shaded area on the right; Lee’s result excludes the vertically shaded area at the top. The combination of the efficiencies of the true best parsing and BMM algorithms can only be situated in the white unshaded area in the middle.

Extensive research on the BMM problem has not yielded a usable algorithm that is substantially better than O(n3); since BMM can be converted to parsing this could explain why the admittedly less extensive research on general CF parsing has not yielded a better than O(n3) algorithm, except through BMM. On the other hand Figure 3.22 shows that it is still possible for general CF parsing to be linear (O(n1)) and BMM to be worse than O(n2).

Rytter [34] has linked general CF parsing to a specific form of shortest-path computation in a lattice, with comparable implications.

Greibach [389] describes the “hardest context-free language”, a language such that if we can parse it in time O(nx), we can parse any CF language in time O(nx). Needless to say, it’s hard to parse. The paper implicitly uses a parsing technique which has received little attention; see Problem 3.7.

[^1]: For a survey see V. Strassen, “Algebraic complexity theory”, in Handbook of Theoretical Computer Science, vol. A, Jan van Leeuwen, Ed. Elsevier Science Publishers, Amsterdam, The Netherlands, pp. 633-672, 1990.

[^2]: V. Strassen, “Gaussian elimination is not optimal”, Numerische Mathematik, 13:354-356, 1969.
