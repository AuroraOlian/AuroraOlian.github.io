# FDS

> the key to understand every data structure
> 1. 了解每种数据结构的定义方式
> 2. 各种操作，ex. 增删改查，标注出一些容易忘记的(give pseudocode)
> 3. 复杂度分析！（有时候这个分析会变得很复杂）
> 4. collect wrong problem

> [!tldr] Link
> [other's error set](https://www.cnblogs.com/Sun-Wind/p/15771420.html)

## Stack 栈

- [1] push & pop

> 若一个栈的入栈序列为 1、2、3、…、N，输出序列的第一个元素是 i，则第 j 个输出元素是

    max{1, i-j+1} ~ i+j-1?

- [2] 后缀表达式
  `a*(b+c)-d` -> `a b c + * d -`

# Tree 树

> [!quote]+ Conception
>
> - degree
>   - degree of a node: number of subtree
>   - degree of a tree: max{degree(node)}
> - parent/children
> - siblings/leaf
> - path
> - length of path ::= number of edges on the path
> - depth of $n_i$ ::= length of the unique path from the root to $n_i$
> - height
>
>   - height of $n_i$ ::= length of the longest path from $n_i$ to a leaf
>   - height of a tree ::=height(root) = depth(deepest leaf)
>
> - ancestors of a node ::= all the nodes along the path from the node up to the root
> - descendants of a node ::= all the nodes in its subtrees

> [!important] Type of Tree
>
> - [[#^ThreadedBinaryTree | Threaded Binary Tree]]
> - Binary Search Tree(BST)
> - Skewed Binary Trees
> - Complete Binary tree: All the leaf nodes are on two adjacent levels

> [!note] Properties of Binary Trees
>
> - The maximum number of nodes on level  i  is $2^{i-1}$
> - The maximum number of nodes in a binary tree of depth k is $2^k - 1$
> - For any nonempty binary tree, $n_0 = n_2 + 1$ where $n_0$ is the number of leaf nodes and $n_2$ is the number of nodes of degree 2.
>   - (Generalized conclusion) For any tree, $n_0 = 1 + 0 \cdot n_1 + 1 \cdot n_2 + 2 \cdot n_3 + \cdots$ where $n_0$ is the number of leaf nodes, $n_i$ is the number of nodes of degree i(i > 0)

> [!note]- Threaded Binary Tree(线索二叉树)
> [一篇不错的文章](https://blog.csdn.net/weixin_50502862/article/details/124662672)
> The links of a binary tree with n nodes are 2n, among which n+1 links are null. We can replace the null links by "threads" which will make traversals easier.
>
> - If Tree->Left is null, replace it with a pointer to the inorder predecessor of Tree
> - If Tree->Right is null, replace it with a pointer to the inorder successor of Tree.
>
> ```c
> typedef  struct  ThreadedTreeNode  *PtrTo  ThreadedNode;
> typedef  struct  PtrToThreadedNode  ThreadedTree;
> typedef  struct  ThreadedTreeNode {
>        int             LeftThread;
>        ThreadedTree    Left;
>        ElementType  Element;
>        int             RightThread;
>        ThreadedTree    Right;
> }
> ```

^ThreadedBinaryTree

> [!note] Complete Binary Tree
> We can represent a complete binary tree with n nodes sequentially, then for any node with index $i$, we have:
> `Array Representation :  BT [ n + 1 ]  ( BT [ 0 ] is not used)`
> index of parent(i) = $\lfloor \frac{i}{2} \rfloor(i \neq 1)$
> index of left child(i) = $2i(2i \le n)$
> index of right child(i) =$2i+1(2i+1 \le n)$

> [!summary]+ Operation
>
> - FirstChild-NextSibling Representation
>   - tree -> binary tree: 先兄弟相连留长子，转 45°，
>   - forest -> binary tree：在每个树形成各自的二叉树的基础上将根节点连起来
> - Pre-order/In-order/Post-order/Level-order Traversals (Recursively | **Iteratively**)
> - BST:
>   - Find/FindMin/FindMax
>   - Insert
>   - **Delete**
>     - Delete a leaf node:  Reset its parent link to NULL.
>     - Delete a degree 1 node:  Replace the node by its single child.
>     - Delete a degree 2 node: 1. Replace the node by the largest one in its left subtree or the smallest one in its right subtree. 2. Delete the replacing node from the subtree.
>       > [!note]-
>       > If there are not many deletions, then lazy deletion may be employed: add a flag field to each node, to mark if a node is active or is deleted.  Therefore we can delete a node without actually freeing the space of that node.  If a deleted key is reinserted, we won’t have to call malloc again.
> - Tree -> Threaded Binary Tree
>   1. write the pre-order/in-order/post-order traversals
>   2. replace the null node with its predecessor/successor(前驱/后驱)

1. full binary tree 的节点数量为$2^n$
2. If a general tree T is converted into a binary tree BT, then which of the following BT traversals gives the same sequence as that of the post-order traversal of T? `In-order traversal`

# Priority Queue 优先队列

A min/max heap is a complete binary tree that is also a min tree.

> [!summary]+ Operation
>
> - **Percolate up/down**
> - Insert
> - Delete min/max
> - **min heap <-> max heap**

```c
// a random array -> heap
for (int i = N / 2; i >= 0; --i)
 PercolateDown(i);
```

# The Disjoint Set ADT 不相交集

> [!quote]+ Conception
>
> - Equivalence Relations
>   A relation R is defined on a set $S$ if for every pair of elements (a, b), $a, b \in S$, $a \ R \ b$ is either true or false.  If $a \ R \ b$ is true, then we say that a is related to b.
>   Properties:
>   1. (Reflexive 自反性) $a \ R \ a$, for all $a \in S$.
>   2. (Symmetric 对称性) $a \ R \ b$ if and only if $b \ R \ a$.
>   3. (Transitive 传递性) $a \ R \ b$ and $b \ R \ c$ that $a \ R \ c$
> - disjoint

> [!summary]+ Operation
>
> - Union and Find -> Union-find
> - Union-by-Size
> - Union-by-Height
> - Path Compression

# Graph 图

> [!quote] Definitions
> $G(V, E)$
> Undirected graph
> Directed graph
> Complete graph: a graph that has the maximum number of edges
>
> Simple path ::= $v_{i1}, v_{i2}, \cdots, v_{in}$ are distinct
> Cycle
> connected: - vi and vj in an undirected G are connected if there is a path from vi to vj (and hence there is also a path from vj to vi) - An undirected graph G is connected if every pair of distinct vi and vj are connected

## Wrong Problem Collection 错题集

1. If an undirected graph G = (V, E) contains 10 vertices. Then to guarantee that G is connected **in any cases**, there has to be at least \_\_ edges.
   如果前 V-1 个节点是全连接的，那么任意加入 1 edge 才可以 guarantee that G is connected.
   37 `YES` | 9 `NO`
2. In a binary search tree which contains several integer keys including 4, 5, and 6, if 4 and 6 are on the same level, then 5 must be their parent.
   `NO` counterexample: 4 <- 3 <- 5 -> 7 -> 6
3. In a complete binary tree with 1102 nodes, there must be \_\_ leaf nodes. (6 分)
   倒数第二排的大部分节点也是叶子节点
   1. 79
   2. 551
   3. 1063
   4. cannot be determined
4. The recurrent equations for the time complexities of programs P1 and P2 are:

- P1: T(1)=1, T(N)=T(N/2)+1;
- P2: T(1)=1, T(N)=2T(N/2)+1;

Then the correct conclusion about their time complexities is:

2. O(logN) for P1, and O(N) for P2
   <https://zhu45.org/posts/2017/Mar/26/maw-chapter-6-priority-queues-heaps-writing-questions/>

If a d-heap is stored as an array, for an entry located in position i, the parent, the first child and the last child are at:
A. ⌈(i+d−2)/d⌉, (i−2)d+2, and (i−1)d+1
B. ⌈(i+d−1)/d⌉, (i−2)d+1, and (i−1)d
C. ⌊(i+d−2)/d⌋, (i−1)d+2, and id+1
D. ⌊(i+d−1)/d⌋, (i−1)d+1, and id

1. For a graph, if each vertex has an even degree or only two vertexes have odd degree, we can find a cycle that visits every edge exactly once
   要求图是联通的

![[Pasted image 20240509233731.png]]

> [!tip]
>
> 1. If time complexity with adjacency list is $O(|E| + |V|)$, then it's $O(|V|^2)$ for adjacency matrix(Just think the graph is dense, then we have $|E| \approx |V|^2$)
> 2. For recursive sorting algorithm, we can use recursive relations to analyse time complexity

## Representation of graph

- adjacency matrix: space complexity$O(|V^2|)$ suitable for dense graph
- adjacency list: $O(|E| + |V|)$ suitable for sparse graph

Question: The vertex is name(string) rather than number
Solutions:

- use _hash table_
- string array(not recommend)
- use pointer to hash table (lose purity)

## Topological sort (DAG) 拓扑排序

time complexity: $O(|V|^2)$ bad point: sequential scan for Indegree array
optimize: use _stack_ or _queue_ to store vertices whose indegree is 0 and adjacency list -> $O(|E| + |V|)$
逆序拓扑排序 ❓

## The shortest path algorithm 最短路径算法

- unweighted: BFS(breadth-first search, like lever-order traversal to tree): use queue and adjacency list -> $O(|E| + |V|)$
- weighted positive edge: Dijkstra algorithm
  1. `findMin`(simply scan the table) $O(|V|^2)$ + `update` $O(|E|)$ = $O($|V|^2)
      PS: 可以通过记录每个节点的上个节点来记录路径，用递归来显示
  2. keep distance in a priority queue(can optimize with pairing heap):
      - `deleteMin` $O(|E|\ log|V|)$ + `decrease` $O(|V|\ log{V})$ = $O(|E|\ log|V|)$
      - decrease -> insert xxx 👀
  3. use Fibonacci heap: $O(|E| + |V|\ log|V|)$ 👀
- weighted edge(maybe negative): combine weighted and unweighted algorithm: If a vertex is updated, then put it into queue (if it's not in queue), then dequeue, update and continue: $O(|E||V|)$
  If there is negative-cost cycle(负值圈) in the graph, stop the algorithm if any vertex has been dequeued for $|V| + 1$ times to ensure the program will end. ❓

If the graph is acyclic, we can use topological sort to improve Dijkstra algorithm $O(|E| + |V|)$
Application: critical path analysis(activity-node graph -> event-node graph: analysis based on edge rather than vertex) find the longest path and obtain earliest/latest completion time of every node, then obtain the slack time(松弛时间), which represent how long one activity can be delayed without delaying the overall completion
all-pairs shortest path problem: use single-source algorithm for $V$ times

## Minimum spanning tree

### Prim

### Kruskal

## Strong Connected Component(SCC) 强连通分量

### Kosaraju Algorithm

# Sort

![[Pasted image 20240521015228.png]]

stability: a sorting algorithm is said to be stable if two objects with equal keys appear in the same order in sorted output as they appear in the input data set.

- stable sort algorithm: Bubble Sort, Insertion Sort, Merge Sort, Count Sort(?)
- un stable sort algorithm: Heap Sort, Quick Sort, Shell Sort

Q: which sort algorithm need extra space?
A: Merge Sort

During the sorting, processing every element which is not yet at its final position is called a "run"

Q: Which sort algorithm will be slowed down if we store the elements in a linked structure instead of a sequential structure?
A: Heap Sort, Shell Sort, Quick Sort
Merge Sort?

## Insertion Sort 插入排序

```c
// Insertion Sort 插入排序
void InsertionSort(ElementType A[], int N) 
{
    // 这样交换赋值的次数会减半
    int j, P;
    ElementType Tmp;
    for (P = 1; P < N; P++) {
        Tmp = A[p];
        for (j = P; j > 0 && A[j-1] > Tmp; j--)
            A[j] = A[j-1];
        A[j] = Tmp;
    }
}
```

Time Complexity: worst $O(N^2)$ best $O(N)$
If the sequence is almost sorted, then insertion sort will run fast

## Shell Sort 希尔排序

shell sort is also called diminishing increment sort(缩小增量排序)
increment sequence(增量序列)

```

```

Question: give two sequence and ask the increment of shell sort
Method: 代入不同的 increment 看这个 increment 的 sequence 是不是 sorted，再比较两序列中元素是否相同

## Heap Sort

```c
void HeapSort(ElementType A[], int N)
{
 for (int i = N / 2; i >= 0; i--)
  PercDown(A, i, N);
 for (int i = N - 1; i > 0; i--) {
  Swap(&A[0], &A[i]);
  PercDown(A, 0, i);
 }

}
```

## Merge Sort

divide-and-conquer strategy

```c
void MergeSort(ElementType A[], ElementType TmpArray[], int Left, int Right)
{
 if (Left < Right) {
  int Center = (Left + Right) / 2;
  MergeSort(A, TmpArray, Left, Center);
  MergeSort(A, TmpArray, Center + 1, Right);
  Merge(A, TmpArray, Left, Center + 1, Right)
 }
}
```

space complexity: $O(NlogN)$ - A 和 TmpArray 拷贝 -> 递归交替层次 - save space: A[] \* max + Temp[] -> Final[], it can also be understood as a number in multiple digits, AT, 第二位表示 A[i], 第一位表示 Temp[i]
time complexity: $O(NlogN)$ (derived from recursive relation)

Comment: It is widely used for external sorting, where random access can be very, very expensive compared to sequential access.

难用于贮存排序
variant: implementation without recursion

## Quick Sort 快速排序

The fastest known sorting algorithm in practice

1. pick pivot(枢纽元)
   - a wrong & uninformed way: choose the first element (🤔bad: If the input is presorted, then quick sort will take $O(N)^2$ time to do nothing)
   - a safe maneuver: randomly choose pivot (🤔bad: random number generation is generally expensive)
   - Median-of-Three Partitioning(三数中值分割法): pick three elements randomly and using the median of these three as pivot
     The minimum and maximum number wind up in the correct place, which act as a sentinel
2. partition (two schemes) 1. 从左到右扫并设置一个分界线 2. 左右两边一起扫，有不符合的就互换
   For very small arrays($N \le 20$), use insertion sort rather than quick sort
   Time complexity: best $O(NlogN)$(analysis is same as merge sort) worst $O(N^2)$

Comment: - Quicksort is probably more effective for datasets that fit in memory. For larger data sets it proves to be inefficient so algorithms like merge sort are preferred in that case.

Application: find k-th maximum number 可以确定 k 大数在 pivot 的左右来缩小区间

## Bucket Sort

## Radix Sort

<https://www.geeksforgeeks.org/msd-most-significant-digit-radix-sort/>

- Least Signification Digit (LSD) radix sort
- Most Signification Digit (MSD) radix sort

## Counting Sort

## Questions

> [!question] Common question
> 判断某个序列是某个排序第 k 次执行完的结果
>
> - quick sort: 看 sequence 中有几个 pivot，正常来说应该有$2^k - 1$（准确来说应该是大于等于），但是如果某个 pivot 是最前/后面的则会少 1 个
> - LSD/MSD radix sort: 直接去看选项中序列的后/前 k 位是不是从小到大（或者自己先写出来也行）

During the sorting, processing every element which is not yet at its final position is called a "run". Which of the following cannot be the result after the second run of quicksort?

A. 5, 2, 16, 12, 28, 60, 32, 72
B. 2, 16, 5, 28, 12, 60, 32, 72
C. 2, 12, 16, 5, 28, 32, 72, 60
D. 5, 2, 12, 28, 16, 32, 72, 60

During the sorting, processing every element which is not yet at its final position is called a "run". To sort a list of integers using quick sort, it may reduce the total number of recursions by processing the small partion first in each run.

> F. The number of recursions is independent of which sequence is processed first

![[Pasted image 20240521020705.png]]

# Hash

# Bonus

## LRU(Lease Recent Used)

支持 get 和 put 操作
[待做的 LFU](https://leetcode.cn/problems/lfu-cache/description/)
