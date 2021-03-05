# Basic
## [youtube playlist](https://www.youtube.com/playlist?list=PLXsmhnDvpjORzPelSDs0LSDrfJcqyLlZc)
## Ref
1. Monograph by Sébastien Bubeck
2. Lecture notes by Lieven Vandenbergh at UCLA
3. Lecture notes by Stephen Boyd at Stanford
4. Lecture notes by Wotao Yin at UCLA


# Contents
## Convex Sets, functions, basic definitions. 
Optimality conditions for constrained possibly non-differentiable convex problems.
### Basics of linear algebra and calculus
### Convex Set 
$$
\forall x_1, x_2 \in \mathbb{C}, \forall \lambda \in [0,1], \lambda x_1 + (1-\lambda)x_2 \in \mathbb{C}
$$
### Convex Functions
$$
\forall x_1, x_2 \in \mathbb{R}^n, \forall \lambda \in [0,1], f( \lambda x_1 + (1-\lambda)x_2 ) \le \lambda f(x_1) + (1-\lambda)f(x_2)
$$
### Optimality Conditions for Convex Optimization
#### Unconstraint
1. Differentiable
$$
f \ convex \rightarrow f(y) \ge f(\hat{x}) + \left < \nabla f(\hat{x}, y-x)\right >  \\
\text{s.t.} \quad \nabla f(\hat{x}) = 0 \rightarrow f(y) \ge f(\hat{x}) \ \forall y
$$
2. Non-differentiable
$$
g_x \in \partial f(x) \leftrightarrows  f(y) \ge f(x) + \left < g_x, y-x \right > \\
\text{If} \ 0 \in \partial f(\hat{x}) \rightarrow f(y) \ge f(\hat{x}) + 0 \ \forall y
$$
#### Constraint
1. Tangent Cone
2. Normal Cone
3. Optimality conditions for constrained optimization
$$
0 \in \nabla f(\hat{x}) + N_{\mathscr{X} }(\hat{x})
$$
4. Apply optimality conditions to projection
projection(all convex)
$$
\min \quad \frac{1}{2} \| x - y \|_2^2 \\
s.t. \quad x \in \mathscr{X}
$$
If $\hat{x}$ is an opt. sol.
$$
0 \in \partial f(\hat{x}) + N_{ \mathscr{X} }(\hat{x}) \\
\Rightarrow 0 \in \hat{x} - y + N_{ \mathscr{X} }(\hat{x}) \Rightarrow y - \hat{x} \in N_{ \mathscr{X} }(\hat{x})  \\
\Rightarrow \left < y- \hat{x}, x - \hat{x}   \right > \le 0 \quad \forall x \in { \mathscr{X} }
$$
5. Projection onto a convex set is a contraction
$x_1$ is the projection of $y_1$ onto the convex set $\mathscr{X}$. $x_2$ is the projection of $y_2$ onto the convex set $\mathscr{X}$. Then
$$
\left < y_1 - x_1, x_2 - x_1 \right > \le 0 \\
\left < y_2 - x_2, x_1 - x_2 \right > \le 0 
$$
Add 
$$
\left < y_1-y_2 - (x_1 - x_2), x_1 -x_2 \right > \ge 0 \Rightarrow \\
\left < y_1-y_2, x_1 -x_2 \right > -\left < x_1 -x_2, x_1 -x_2 \right > \ge 0 \\
\left < y_1-y_2, x_1 -x_2 \right > \ge \|x_1 -x_2 \|^2 \\
\left < u,v \right > \le \|u\|  \|v\| \Rightarrow \|y_1-y_2\|\|x_1-x_2\| \ge \|x_1 -x_2 \|^2 \\
\|y_1-y_2\| \ge \|x_1 -x_2 \|
$$

## Gradient and Subgradient descent.
Convergence rates for convex functions, for convex and smooth functions, for convex, smooth and strongly convex functions.
### Unconstraint
minimize a linear(1st order Taylor) approximation
$$
f(x) \approx \text{linear function} = f(x_k) + \left < \nabla f(x_k), x-x_k \right >
$$
Idea: start $x_k$ but not to far at itration $k$.
$$
x_{k+1} = \argmin_x:f(x_k) + \left < \nabla f(x_k), x-x_k \right > + \frac{1}{2 \eta} \| x - x_k \|^2
$$
Take derive(grad) set to zero:
$$
0 + \nabla f(x_k) + \frac{1}{\eta} (x-x_k) = 0 \Rightarrow x_{k+1} = x_k - \eta \nabla f(x_k) 
$$
- step size: small enough 
- convergence rate: linear or error $\approx e^{ - ck }$
- improvement at every iteration

Subgradient Method:
- gradient descent improves at every iteration, unlike sub-gradient
- gradient descent can take a "big" step size: self-tuning property
- gradient descent takes bigger steps when far away

We formalize these through properties some convex functions have. We will then use properties directly to show different convergence rates, depending on which properties a particular convex function enjoys.
### Smooth and Strongly Convex Function
1. Smoothness(光滑是表征在点附近，梯度也很小) and "self-tunning": $\| \nabla f(x) \| \rightarrow 0 \ \text{as} \ x\rightarrow x^*$
   Need: $\| \nabla f(x) - \nabla f(y) \|_2 \le \beta \cdot \|x-y\|_2$. 
   Def'n: A function f is called $\beta$-smooth if its gradient is Lispschitz continnous with parameter $\beta$.
2. Quadratic upper bound
   Claim: If $f(x)$ is $\beta$-smooth, then: $\frac{\beta}{2}\|x\|_2^2 - f(x)$ is convex (f(x) maybe not convex). Define $g(x) = \frac{\beta}{2}\|x\|_2^2 - f(x)$. We will show $g(x)$ is monotone, then monotone applays convex.
   $$
   \left < \nabla g(x) - \nabla g(y), x- y \right> = \left < \beta(x-y) - (\nabla f(x) - \nabla f(y)), x- y \right> \\
   = \beta \|x-y\|_2^2 - \left < \nabla f(x) - \nabla f(y), x-y \right > \\
   \ge \beta \|x-y\|_2^2 - \| \nabla f(x) - \nabla f(y) \|_2 \cdot \|x-y\|_2 \ge 0
   $$
   Then 
   $$
   g(y) \ge g(x) + \left <  \nabla g(x), y-x \right > \Rightarrow \\
   \frac{\beta}{2}\|y\|_2^2 - f(y) \ge \frac{\beta}{2}\|x\|_2^2 - f(x) + \left < \beta x - \nabla f(x), y-x  \right > \Rightarrow \\
   f(y) \le f(x) + \left < \nabla f(x), y-x \right > + \frac{\beta}{2} \|y-x \|_2^2
   $$
   If $f$ is twice diff.: f convex $\Leftrightarrow \nabla^2 f(x) \succeq 0$. 
   If $f$ is $\beta$-smooth $\Leftrightarrow \nabla^2 f(x) \preceq  \beta \cdot I$.
3. Strong Convexity(强凸是表征在离点很远地方，可以很快就收敛回来)
   Define: A function f is strongly convex by parameter $\alpha$ if $g(x) = f(x) - \frac{\alpha}{2} \| x \|_2^2$ is convex.
   $$
   g(y) \ge g(x) + \left < \nabla g(x), y-x  \right > \Rightarrow \\
   f(y) - \frac{\alpha}{2} \| y \|_2^2 \ge f(x) - \frac{\alpha}{2} \| x \|_2^2 + \left < \nabla f(x) - \alpha x, y-x  \right > \Rightarrow \\
   f(y) \ge f(x) + \left < \nabla f(x) , y-x  \right > + \frac{\alpha}{2} \|y -x \|_2^2
   $$
   Strong Convexity add the term $\frac{\alpha}{2} \|y -x \|_2^2$ in the definition of the convex.

   If $f(x)$ is twice differentiable and $\alpha$-strongly convex $\Leftrightarrow \nabla^2 f(x) \succeq \alpha \cdot I \Leftrightarrow (\nabla^2 f(x) - \alpha I ) \succeq 0$.

4. Properties of Smooth and Strongly Convex Functions.
   
|函数$f(x)$ | 性质 |
|---------|----------|
| convex | $f(y) \ge f(x) + \left < \nabla f(x), y-x \right >$ | 
| $\beta$-smooth $\| \nabla f(x) - \nabla f(y) \|_2 \le \beta \cdot \|x-y\|_2$ | $f(y) \le f(x) + \left < \nabla f(x), y-x \right > + \frac{\beta}{2} \|y-x \|_2^2$ | 
| $\alpha$-convex | $f(y) \ge f(x) + \left < \nabla f(x) , y-x  \right > + \frac{\alpha}{2} \|y -x \|_2^2$ | 
### Convergence Rates
## Oracle Lower Bounds and Accelerated Methods
## Proximal Gradient.
ISTA and FISTA
## Mirror Descent
## Frank Wolfe and Conditional Gradient
## Stochastic methods.
SVRG
## Newton and Quasi-Newton Methods
## Interior Point Methods
## Legendre-Fenchel Duality
## Dual Decompositon Algorithms
Proximal Point Algorithm, Prox Grad in the Dual, Augmented Lagrangian Method
## Monotone Operators, Contractive Operators
Non-Expansive and Firmly Non-Expansive operators