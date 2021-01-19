# FBstab算法的研究

## QP nonnegative least squares (QPNNLS)

#### 什么是QP问题

- [qp wiki  ](https://en.wikipedia.org/wiki/Quadratic_programming)
- [一个大学生的日常笔记](https://www.zhihu.com/column/c_119426147)


$$
\begin{aligned}
\min_{x} \ & J(x) = \frac{1}{2}x^TQx + c^T x \\
s.t. \quad & Ax \preccurlyeq b
\end{aligned}
$$
就是说一个二次规划问题是性能函数为二次的，且约束是线性的一种特殊的非线性规划问题。这个问题主要由Q的性质来决定，这里来考虑凸二次规划问题。

 

常用的解决方法有

- interior point
- active set
- augmented Lagrangian
- conjugate gradient
- gradient projection
- extensions of the simplex algorithm

#### 等式约束二次规划

$$
\begin{aligned}
\min \ & \frac{1}{2} x^TQx + c^T x \\
s.t. \ & Ax = b
\end{aligned}
$$

设Q半正定，A为m*n，r(A)=m。

对A进行分块$A = (B, N)$

 

#### 什么是active-set 方法

- [active-set method wiki](https://en.wikipedia.org/wiki/Active-set_method)
- [最优化理论与方法-第十二讲-二次规划](https://www.bilibili.com/video/BV1vQ4y1P77A?p=2)



















