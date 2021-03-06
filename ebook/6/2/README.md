# 6.2 下推自动机

在上面的例子中我们进行的步骤与被称为*下推自动机*的技术很相似。下推自动机（*PDA*）是一个假想的数学装置，它读入输入串，用栈（stack）进行控制。栈内可以包含属于*栈符号表（stack alphabet）*的符号。*栈*是一种只能从一端被使用的列表：最后一个进入（“pushed”）列表的元素将第一个被取出（“popped”）的。栈有时被叫做先进先出表或*FILO表*：第一个进去的元素最后一个取出。在上面的例子中，预测的工作方式就像一个栈，这也就是下推自动机使用栈的目的。因此我们将这个栈称作*预测栈（prediction stack）*。同时，这个栈解释了术语“下推”自动机：为了后续过程，自动机在栈上“推入”符号。

下推自动机的工作方式是弹出一个栈符号然后读取一个输入符号。接着这两个符号一般会提供我们几种将被推入的栈中的选择。所以存在一个（输入符号，栈符号）二元组到栈符号串列表的映射。在栈为空并且达到输入符号的尾部的时候，自动机接受输入的句子。如果选择存在多种（也就是（输入符号，栈符号）映射到不止一个的串上），当这些选项中存在一些选项使得读到句尾时栈为空，自动机接受句子。

这种自动机是以满足*Greibach范式(GNF)*的上下文无关语法为模型的。在这种范式中，所有语法规则都满足*A→a*或*A→aB<sub>1</sub>B<sub>2</sub>...B<sub>n</sub>*，这里*a*是一个终结符，*A,B<sub>1</sub>,...,B<sub>n</sub>*是非终结符。栈符号当然是终结符。*A→aB<sub>1</sub>B<sub>2</sub>...B<sub>n</sub>*形式的规则对应着 *（a,A）*对*B<sub>1</sub>B<sub>2</sub>...B<sub>n</sub>*的映射。这意味着如果输入符号是*a*，并且预测栈栈顶是*A*，那我们可以接受*a*，将预测栈上的*A*替换为串*B<sub>1</sub>B<sub>2</sub>...B<sub>n</sub>*。*A→a*对应着 *（a,A）*向空串的映射。开始时，这个自动机栈顶为语法的开始符号。每一个不产生空串的上下文无关语法都能转化为Greibach范式（Greibach[8]）。大多数形式语言理论的书都阐述了如何做这项工作（例如见Hopcroft and Ullman[391]）。

图Fig6.1的示例语法已经是Greibach范式了，所以我们轻松的从它构建一个下推自动机。这个自动机在图Fig6.3用映射的形式表示了出来。

![图1](../../img/6.2_1-Fig.6.3.png)

这里有很重要的一点需要注意：很多下推自动机是非确定性（non-deterministic）的。比如，图Fig6.3所示的下推自动机可以为 **（a,A）**选择空串或**S**。事实上，存在不能构建出具有确定性的下推自动机的上下文无关语言，尽管我们能构建出非确定性的。

还有需要说明的是：这里我们讨论的下推自动机是自动机理论里的的简化版。在自动机理论里，下推自动机有所谓状态（state），相应的映射是从（state, input symbol, stack symbol）三元组到（state, list of stack symbols）的二元组。从这个角度看，它们像是用一个栈拓展了的有限状态自动机（第五章讨论的）。而且，下推自动机有两种类型：一些用栈空表示接受句子，另一些用在标注为接受状态（accepting state）的状态处结束表示接受。也许这让人很意外，拥有状态并不能让下推自动机这个概念更有吸引力，因为有状态的下推自动机仍然只能接受可以被上下文无关语法描述的语言。在我们的论题中，下推自动机只有一个状态，所以我们已经忽略它了。

如果我们想将其转化为解析用的自动机（parsing automata），以上描述的下推自动机有几个问题需要解决。首先，下推自动机需要我们将我们的语法转化为Greibach范式。虽然语法转换对形式语言学家不是问题，但我们还是希望能尽量用原始的语法而不加处理。现在我们稍微放宽Greibach范式的要求，允许在栈中推入终结符，然后对所有终结符*a*，在映射关系中添加：

(*a,a*)&rarr;

这样我们就能使用所有右侧都由终结符开始的任何语法了。同时，我们可以将下推自动机的工作步骤分为“匹配”和“预测”，就像我们在6.1节中的例子做的那样。“匹配”步骤对应 *(a,a)→*的使用，“预测”步骤对应 *(,A)→...*，这个就是说，栈上的非终结符被它的一个右侧替代，不用消费输入符号。对图6.1所示语法，就有了图Fig6.4所示的映射关系，这事实上仅仅就是重写了图Fig6.1的语法。

![图2](../../img/6.2_2-Fig.6.4.png)

我们之后将会看到，即使用了这种方法，我们可能还是必须改动语法，但现在这看起来就非常可行了，所以我们采用这种策略。这个策略同时解决了另一个问题：ε规则不再需要特殊的处理了。为了得到Greibach范式，我们还是需要除去它们，但这不再是必须的了，因为它们刚好对应 *(,A)→*映射。

第二个缺点是这个下推自动机没有保存使用过的规则（映射）的记录。因此，我们在这个自动机中引入一个*分析栈（analysis stack）*。对每一个预测的步骤，我们将被替换的非终结符，以使用的右侧的序号（将右侧从1到n标上序号）为后缀推入分析栈。这样，分析栈刚好跟图Fig6.2中虚线左边的部分对应，这个虚线分隔了分析栈与预测栈。这导致了这个自动机在每个时候都有如图Fig6.5所示结构。这个结构，跟当前状态，栈等等，被称作一个*即时描述（instantaneous description）*。在图Fig6.5中，匹配过程可以本看作将竖直线向右推。

![图3](../../img/6.2_3-Fig.6.5.png)

然而最重要的第三个缺点，是非确定性。形式上，这个自动机当且仅当有一个选择的序列使得在句尾的时候栈空接受句子，这个说法可能让人满意，但是这不是我们的目的，因为这没有告诉我们怎么得到这个序列。我们必须引导自动机去做正确的选择。回看6.1节的例子，在推导的很多时候需要做出选择，而且我们的选择基于了一些对当前的语法的特殊的考虑：有时我们关注句子的下一个符号，也有时我们看得更远，去确定之后没有**a**出现。在这个例子里，选择是容易的，因为所有右侧由终结符开始。然而大多数时候，找到正确的选择要困难的多。比如右侧可以由一个非终结符开始，它又有从非终结符开始的右侧，等等。

在第八章我们将看到，给定句子的下一个符号，很多语法仍然允许我们决定使用哪一个右侧。但是在本章中，我们将关注能在更大一部分的语法上起作用的自顶向下解析方法。而不是尝试基于特殊考虑来决定选择，我们要从所有可能出发来引导自动机。在第三章我们曾看到，在解决在特定的点有多种分支的问题的时候一般有两种方法：深度优先搜索和广度优先搜索。我们将看到如何完成这两种方法的机器操作。由于操作的步数可能会按输入规模以指数级别增长，即使是一个小例子也可能有庞大的工作量。为了让事情更有意思，我们将只用图Fig3.4所示的固有歧义的语言，这个语法在图6.6这里重复了一遍。我们将用**aabc**作为测试输入。

![图4](../../img/6.2_4-Fig.6.6.png)
