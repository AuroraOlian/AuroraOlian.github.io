# Chap 1 The Foundations: Logic and Proofs

## Link

[Other’s Notes(Perfect!)](https://oneko.zone/zju/dm/ch6/#simple-properties)

[Problem Set](https://www.yuque.com/oneko/something/discrete-math-remake-exercises#UFLMB)

[Other’s Notes](https://www.yuque.com/linguisty/zju_courses/discrete)

# 1 Logic and Proofs

1. We use **predicates** to describe both **preconditions** and **postconditions**

> [!caution]
>
> - If the domain is empty, then "for all x P(x)" is **true**: no elemet x in the domain for whitch P(x) is false
> - If the domain is empty, then "There is an x shuch that P(x)" is **false**: no elemet x in the domain for whitch P(x) is true

1. a single _counterexample_ is all we need to establish that "for all x P(x)" is false
2. specify the **domain** is mandatory when **quantifiers** are used
   $$\forall x (P(x)\wedge Q(x)) \equiv \forall x P(x) \wedge \forall x Q(x) $$
$$\exists x (P(x)\vee Q(x)) \equiv \exists x P(x) \vee \exists x Q(x) $$

## Additional content

### Propositional Normal Form: CNF & DNF

![[Pasted image 20240423084244.png]]

_Literal:_ P or $\neg$P

> [!note]



```ad-note 主要内容
collapse: open
三大类数据结构
~~~c
#include <stdio.h>
~~~
```

::: note

!!! caution
      Negation must behind atomic proposition rather than compound proposition.
      $\neg$p Ture | $\neg$(p$\wedge$q) False
<!-- > [!caution]+
> Negation must behind atomic proposition rather than compound proposition.
> $\neg$p Ture | $\neg$(p$\wedge$q) False -->

disjunctions/conjunctions with one or more literals as disjuncts/conjuncts called disjunctive/conjunctive clauses
A conjunction with one or more disjunctive clauses as its conjuncts is said to be in conjunctive normal form(CNF):
$$(A_{1, 1} \vee ... A_{1, n_1}) \wedge ... \wedge (A_{k, 1} \vee ... A_{k, n_k})$$

### Prenex Normal Form(PNF)

1. Eliminate all occurrences of $\rightarrow$ and $\leftrightarrow$ from the formula in question.
2. Move all negations inward such that, in the end, negation only appear as part of literals.
3. Standardize the variables apart (when necessary).
4. The prenex normal form can now be obtained by moving all quantifiers to the front of the formula.
   ![[Pasted image 20240423084517.png]]
   EX:
   ![[Pasted image 20240306195436.png]]

# 2 Basic Structure

> [!example] bijection
> $N \leftrightarrow N^2$ ($N$ is a set of natural numbers) $\rightarrow |N| = |N \times N|$

> [!quote] Conception
>
> - **cardinality** $| S |$
> - subset -> proper subset
> - power sets: $| P(S) | = 2 ^ n$ > $S = \{ \emptyset \} \rightarrow P(S) = \{ \emptyset, \{ \emptyset \} \}$ > $S = \{ \emptyset, \{ \emptyset \} \} \rightarrow P(S) = \{ \emptyset, \{\emptyset\}, \{\{\emptyset\}\}, \{\emptyset, \{\emptyset\}\} \}$
> - Cartesian product
> - Set Operation
>   - Union
>   - Intersection
>   - Difference
>   - Symmetric difference
> - Proving Set Identities
>
> 1.  Subset method
> 2.  Membership Tables
> 3.  Apply existing identities

## 2.3 Functions

> [!quote] Conception
> domain/codomain
> range
>
> - one-to-one(injective)
> - onto(surjective)
> - one-to-one correspondence(bijection): The two sets must have the same cardinality
> -

# 4 Number Theory and Cryptography

$a = d q + r$
dividend = divisor × quotient + remainder
$q = a \ div \ d$
$r = a \ mod \ d$

# 6 Counting ⭐⭐⭐

## 6.1 The Basics of Counting

- The Product Rule ^fdf1db
- The Sum Rule
- The Subtraction Rule(the principle of inclusion-exclusion)
- The Division Rule

## 6.5 Generalized Permutations and Combinations

Distributing Objects into Boxes

#### distinguishable objects and distinguishable boxes

#### distinguishable objects and distinguishable boxes

#### distinguishable objects and distinguishable boxes

#### distinguishable objects and distinguishable boxes

| objects\boxes     | distinguishable | indistinguishable |
| ----------------- | --------------- | ----------------- |
| distinguishable   |                 |                   |
| indistinguishable |                 |                   |

# 8 Advanced Counting Techniques

## 8.1 Applications of Recurrence Relations

> [!note] Common question type
> Q: Find a recurrence relation and give initial conditions for a specific problem, and then solve $a_k$，$k$ is generally small
> A: Item by item(一项一项带进去算): $a_1 \rightarrow a_2 \rightarrow a_3 \rightarrow \cdots \rightarrow a_k$

> [!tip]
>
> - 往往可以写出多个递推式，我们需要找出那个最小的
> - 有一大部分题目是讨论新增的东西(sum rule)，每种类型都会搭配一个原有的东西(product rule)（这部分一般用$a_{k-1}, a_{k-2}$等形式表示）

> [!example] Find a recurrence relation for the number of bits strings of length n that ^b730d8

1. contain a pair of consecutive 0s
2. contain three consecutive 0s
3. not contain three consecutive 0s
4. contain the string 01
   Analysis:
5. $a_n = a_{n-1} + a_{n-2} + 2^{n-2} \ (n \ge 2)$
   考虑最新的一位，如果是 1 就是 n-1 位符合条件的位串，如果是 0 就有可能使 n-1 位不符合条件的位串成立，故要考虑第 n-1 位，如果又是 0 那不用管后面 n-2 位是什么了

- 1+ xxx(bits strings of length n-1 that contain a pair of consecutive 0s)
- 01+ xxx(bits strings of length n-2 that contain a pair of consecutive 0s)
- 00 + xxx(any bits strings of length n-2)

2.  $a_n = a_{n-1} + a_{n-2} + a_{n-3} + 2^{n-3} \ (n \ge 3)$

- 1+ xxx(bits strings of length n-1 that contain a pair of consecutive 0s)
- 01+ xxx(bits strings of length n-2 that contain a pair of consecutive 0s)
- 001+ xxx(bits strings of length n-3 that contain a pair of consecutive 0s)
- 000 + xxx(any bits strings of length n-3)

3.  $a_n = a_{n-1} + a_{n-2} + a_{n-3} \ (n \ge 3)$

- 1 + xxx(n-1)
- 01 + xxx(n-2)
- 001 + xxx(n-3)
- 000 not meet the contain

4.  $a_n = a_{n-1} + 2^{n-1} - 1 \ (n \ge 2)$

- 1 + xxx(n-1)
- 0 + xxx(any bits strings of length n-1 containing 1)
- 这道题联想到前面排列组合的一道难题，求包含两个 01 的位串: 1 0 1 0 1 0 排列（0/1 的个数不定，但都>0）故也可以用插板法做

### Dynamic Programming

安排时间表

## 8.2 Solving Linear Recurrence Relations

> [!quote] Conception
> linear
> homogeneous $\rightarrow$ nonhomogeneous
> with constant coefficients
> recurrence relation
> degree
>
> characteristic equation/root with multiplicity $m$
> general form of solution

> [!info] Conclusion
> $$f_n = \frac{1}{\sqrt{5}} (\frac{1 + \sqrt{5}}{2})^n - \frac{1}{\sqrt{5}} (\frac{1 - \sqrt{5}}{2})^n$$

^5f3be3

不算难，记住解题的固定步骤就好就好，特别是我已经学过 ODE 了
需要记住的结论
关联

- 这些方程的结果可以用数学归纳法证明，有些式子算出来可以再代一项来验证
- 和 8.1 结合起来可能就是自己列出 recurrence relation 并求解

## 8.4 Generating Functions

sequence -> series
Generating functions are useful for manipulating sequences.
 to solve many kinds of counting problems
For example, the problem of combination or permutation with constraints
 to solve the recurrence relations
 to prove combinatorial identities

![[Pasted image 20240430105138.png]]

![[Pasted image 20240505162653.png]]

> [!note] Solutions to find the coefficient
>
> 1. use brute force algebra and just multiply everything out
> 2. view the problem as asking for the solution to a particular combinatorial problem and solve the problem by other means.
> 3. get a closed form expression for the coefficients, using the generating function theory developed in this section.

> [!example]
> What is the generating function for $\{a_k\}$, where $a_k$ is the number of solutions of $x_1$+ $x_2$+ $x_3$= k when $x_1$, $x_2$, and $x_3$ are integers with $x_1\ge2$, $0\le x_2\le3$, and $2\le x_3\le5$?
> generating function is $(x^2 + x^ 3+ x^4 + \ldots) ( 1 + x+ x^2 + x^3) (x^2+ x^ 3+ x^4 + x^5) = x^4( 1 + x + x^2)$
>
> Find the coefficient of $x^{10}$ in the power series of each of these functions.
>
> 1. $(1+x^{5}+x^{10}+x^{15}+\cdots)^{3}$
> 2. $(x^{3}+x^{4}+x^{5}+x^{6}+x^{7}+\cdots)^{3}$

^00b1f5

Extended Binomial Coefficient

## 8.5 Inclusion-Exclusion 容斥原理

> [!note] Inclusion-Exclusion
> $$\mid A_1\cup A_2\cup \cdots \cup A_n\mid=\sum_{i=0}^n\mid A_i\mid - \sum_{1\leq i<j\leq n}\mid A_i\cap A_j\mid + \sum_{1\leq i<j<k\leq n}\mid A_i\cap A_j\cap A_k\mid + \cdots + (-1)^{n+1} \mid A_1\cap A_2\cap \cdots \cap A_n \mid$$
> Proof: Suppose a is a member of exactly $r$ of the sets $A_1, A_2, \ldots, A_n$, it is counted $C(r, m)$ times by the summation involving $m$ of the sets $A_i$

> [!example]
>
> 1. How many positive integers not exceeding 1000 that are not divisible by 5, 6 or 8?
> 2. How many permutations of the 26 letters of the English alphabet do not contain any of the strings fish, rat or bird?
> 3.

> [!attention] 计算能被 6 和 8 整除的并集时是 1000/24（最小公因数）而不是 1000/48

## Applications of Inclusion-Exclusion

核心就是**正难则反**，然后用总数减去具有某些性质的计数结果
比如错排问题中，正看某个物体的位置是不确定的，但如果反过来看他的位置就是确定的，并且也对其他物体的位置没有要求

### An Alternative Form of Inclusion-Exclusion

How many solutions does $x_1 + x_2 + x_3 = 11$ have, where $x_1$, $x_2$ and $x_3$ are nonnegative integers with $x_i > n$ ?
^00097a

### The Sieve of Eratosthenes 埃氏筛法

计数 100 以内的所有质数
**反**: - 令  $P_i$  分别为 100 以内被 2, 3, 5, 7 整除的整数

### The number of Onto Functions

$$n^m - C(n, 1)(n-1)^m - C(n, 2)(n-2)^m - \cdots + (-1)^{n-1}C(n, n-1) \cdot 1^m$$
员工分工作，老师分糖
$A=\{a_1,a_2,\ldots,a_m\},B=\{b_1,b_2,\ldots,b_n\}$
**反**：令 $P_i$ 为 $b_i$ 不在 $A\to B$ 的 range 里

> [!example]
> In how many ways can seven different jobs be assigned to four different employees so that each employee is assigned at least one job and the most difficult job is assigned to the best employee?
> Solution 1: Temporarily ignore the additional condition -> the probability that the most difficult job is assigned to the best employee is $\frac{1}{4}$
> Solution 2: assign six jobs to four employee + assign six jobs to three employee
> Solution 3: see my draft

### Derangement 完全错排 -> The Hatcheck Problem

$$D_n = n![1 - \frac{1}{1!} + \frac{1}{2!} - \frac{1}{3!} + \cdots + (-1)^n \frac{1}{n!}]$$
$$\frac{D_n}{n!} \approx e^{-1} \approx 0.368$$

# 9 Relations

## 9.1 Relations and Their Properties

_binary relation_ from $A$ to $B$ is a subset of $A \times B$

- $R \subseteq A \times B$
- $R=\{(a,b)|a\in A,b\in B,aRb\}$

> - function is a special relation
> - Relations are a generalization of graphs of function.

A _relation on a set_ $A$ is a relation from $A$ to $A$
how many: $2^{|A|^2}$

Presenting relations

- list its all ordered pairs
- using a set build notation/specification by predicates
- 2D table
- Connection matrix/zero-one matrix
- Directed graph/Digraph

### properties of relations

- reflexive(自反): $\forall x(x\in A\to(x,x)\in R)$
- irreflexive(反自反): $\forall x(x\in A\to(x,x)\notin R)$
- symmetric(对称): $\forall x\forall y((x,y)\in R\to(y,x)\in R)$
- antisymmetric(反对称): $\forall x\forall y((x,y)\in R\land(y,x)\in R\to x=y)$
- asymmetric(非对称): $\forall x \forall y ((x, y) \in R \rightarrow (y, x) \notin R)$
- transitive(传递): $\forall x\forall y\forall z((x,y)\in R\wedge(y,z)\in R\to(x,z)\in R)$

|                                                 | Connection matrix                                          | digraph                                                                                  |
| ----------------------------------------------- | ---------------------------------------------------------- | ---------------------------------------------------------------------------------------- |
| reflexive<br>$2^{n^2 - n}$                      | All elements on the main diagonal must be 1s.              | There is a loop at every vertex of the directed graph-> each vertex has a loop to itself |
| irreflexive<br>$2^{n^2 - n}$                    | All elements on the main diagonal must be 0s.              | No vertex has a loop to itself                                                           |
| symmetric<br>$2^\frac{n(n+1)}{2}$               | The symmetric positions are both 0 or 1                    | If there is an arc(x, y) there must be an arc(y, x) -> both bidirectional edge           |
| antisymmetric<br>$2^n \cdot  3^\frac{n^2-n}{2}$ | Symmetric positions cannot both be 1 (they can both be 0)  | If there is an arc(x, y) there must be no arc(y, x) -> no bidirectional edge             |
| asymmetric<br>$3^\frac{n^2-n}{2}$               | antisymmetric + irreflexive                                |                                                                                          |
| transitive                                      | $\overline{\left(m_{ij}\wedge m_{jk}\right)}\vee m_{ik}=1$ | If there is an arc from x to y and one from y to z then there<br>must be one from x to z |

> No general formula that counts the number of transitive relations on a finite set is known

inverse relation: $R^{-1}=\{ (b,a)\mid(a,b)\in R \}$
complementary relation: $\overline{R}=\{ (a,b)\mid(a,b)\notin R \}$

> [!note] > **When check the property transitive, we can ignore arc(x, x) or loops to itself**
>
> reflexive and irreflexive are not opposites
>
> - a relation can be neither reflexive and irreflexive
> - empty relation is reflexive and irreflexive(Only such relation fits!)
>
> symmetric and antisymmetric are not opposites
> transitive doesn't require digraphs has a circle

> [!caution]
> the relation x is a multiple of y
>
> - on set of all integers is reflexive, transitive
> - on set of all **positive** integers is reflexive, **antisymmetric**, transitive

### Combining Relations

**从右往左生效**
$$S\circ R=\{(a,c) \mid a\in A\land c\in C\land \exists b(aRb \land bSc\}$$
$S\circ R \neq R\circ S$
$S\circ R=M_R\cdot M_S$

The definition of $R^n$: $R_1 = R, R^{n+1} = R^n \circ R$
from associative law, we have $R^{n+1} = R \circ R^n$
The relation $R$ on a set $A$ is transitive if and only if $R^n\subseteq R, n=1,2,3,...$

> Try to proof it!

## 9.4 Closures of Relations 关系闭包

> [!abstract]
> 考察闭包的定义以及如何得到闭包

> R 是集合 A 上的关系。R 可能具有或者不具有某些性质 P，例如自反性、对称性或传递性。如果存在包含 R 的具有性质 P 的关系 S，并且 S 是所有包含 R 且具有性质 P 的关系的子集，那么 S 叫做 R 的关于性质 P 的闭包

- Reflexive Closure
  $r(R)=R\cup I_A,I_A=\{(x,x)\mid x\in A\}$
  $R=R\cup I_A\Leftrightarrow R$ is reflexive
- Symmetric Closure
  $s(R)=R\cup R^{-1}$
  $R=R\cup R^{-1} \Leftrightarrow R$ is reflexive
- Transitive Closure
  $t(R) = R^* = R\cup R^2\cup...UR^k$
  $t(R) = R^*$ is transitive
  - brute solving
  - **Warshall’s Algorithm**

> [!quote] Conception
> Let $R$ be a relation on a set $A$. There is ap the of length n, where n is a positive integer, from a to b if and only if $(a, b) \in R^n$
> The connectivity relation denoted by $R^*$, is the set of ordered pairs (a, b) such that there is a path (in $R$) from a to b: $R^*=\bigcup_{n=1}^\infty R^n$

> [!note]
> 计算一个 relation 关系闭包合集的计算顺序：s(R)->t(R)->r(R)

## 9.5 Equivalence Relations

有几个证明还没看过……

## 9.6 Partial Orderings

> [!example] caution
> Determine the g.l.b and l.u.b of the below subsets
>
> - $(P(S), \subseteq)$, where $P(S)$ is the power set of a set S
>   g.l.b: $A \cap B$ l.u.b: $A \cup B$
> - $(P(S), \supseteq)$, where $P(S)$ is the power set of a set S
>   g.l.b: $A \cup B$ l.u.b: $A \cap B$
