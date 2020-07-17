# 4.4 Conclusion

The non-directional methods take hold of the input string over its full width. The top-down method (Unger) tries to cut the input string into segments and impose a structure on it deriving from the start symbol; if it succeeds, it has found a parsing. The bottom-up method tries to divide the input into recognizable segments, which can then be assembled into the start symbol; if it succeeds, it has found a parsing. Although their look-and-feel is quite different, both methods can be implemented by filling in a table; only the order in which the entries are computed differs.

Rus [28] presents a remarkable, deterministic non-directional bottom-up parsing algorithm.