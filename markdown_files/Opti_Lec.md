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
#### Smoothness 
光滑是表征在点附近，梯度也很小
1. "self-tunning": $\| \nabla f(x) \| \rightarrow 0 \ \text{as} \ x\rightarrow x^*$
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
#### Strong Convexity
强凸是表征在离点很远地方，可以很快就收敛回来
   Define: A function f is strongly convex by parameter $\alpha$ if $g(x) = f(x) - \frac{\alpha}{2} \| x \|_2^2$ is convex.
   $$
   g(y) \ge g(x) + \left < \nabla g(x), y-x  \right > \Rightarrow \\
   f(y) - \frac{\alpha}{2} \| y \|_2^2 \ge f(x) - \frac{\alpha}{2} \| x \|_2^2 + \left < \nabla f(x) - \alpha x, y-x  \right > \Rightarrow \\
   f(y) \ge f(x) + \left < \nabla f(x) , y-x  \right > + \frac{\alpha}{2} \|y -x \|_2^2
   $$
   Strong Convexity add the term $\frac{\alpha}{2} \|y -x \|_2^2$ in the definition of the convex.

   If $f(x)$ is twice differentiable and $\alpha$-strongly convex $\Leftrightarrow \nabla^2 f(x) \succeq \alpha \cdot I \Leftrightarrow (\nabla^2 f(x) - \alpha I ) \succeq 0$.

#### Properties of Smooth Functions.
   
|函数$f(x)$ | 性质 |
|---------|----------|
| convex | $f(y) \ge f(x) + \left < \nabla f(x), y-x \right >$ | 
| $\beta$-smooth $\| \nabla f(x) - \nabla f(y) \|_2 \le \beta \cdot \|x-y\|_2$ | $f(y) \le f(x) + \left < \nabla f(x), y-x \right > + \frac{\beta}{2} \|y-x \|_2^2$ | 
| $\alpha$-convex | $f(y) \ge f(x) + \left < \nabla f(x) , y-x  \right > + \frac{\alpha}{2} \|y -x \|_2^2$ | 

1. Smoothness guarantees improvement
    GD: $x^{+} = x - \eta \nabla f(x)  \rightarrow x^+ - x = - \eta \nabla f(x)$
    Then
    $$
    f(x^+) \le f(x) + \left < \nabla f(x), x^+ -x \right > + \frac{\beta}{2} \| x^+ - x\| \\
    = f(x) - \eta \left < \nabla f(x), \nabla f(x) \right > + \frac{\beta}{2} \eta^2 \| \nabla f(x) \|^2 \\
    = f(x) - \eta (1 - \eta \frac{\beta}{2}) \| \nabla f(x) \|^2 \\
    \Rightarrow f(x^+)- f(x) \le - \eta (1 - \eta \frac{\beta}{2}) \| \nabla f(x) \|^2
    $$
    If we choose $\eta$ small enough($\eta < \frac{2}{\beta}$) that $\eta (1 - \eta \frac{\beta}{2}) \ge 0$, then we guarantee improvement. Typically we choose $\eta = \frac{1}{\beta}$: 
    $$
    x^+ = x - \frac{1}{\beta} \nabla f(x) \ \And \ \eta(1-\eta \cdot \frac{\beta}{2}) = \frac{1}{2 \beta} \\
    \Rightarrow f(x^+) \le f(x) - \frac{1}{2 \beta} \| \nabla f(x) \|_2^2
    $$
2. Bound on suboptimality of any point
   If f is $\beta$-smooth: 
   $$
   \frac{1}{2 \beta}\| \nabla f(x) \|_2^2 \overset{(a)}{\le} f(x) - f(x^*) \overset{(b)}{\le} \frac{\beta}{2} \| x-x^* \|_2^2
   $$
   Again, use quadic upper bound: $f(y) \le f(x) + \left < \nabla f(x), y-x \right > + \frac{\beta}{2} \|y-x \|_2^2$
   For $(b)$, 
   $$
   f(x) \le f(x^*) + \left < \nabla f(x^*), x-x^* \right > + \frac{\beta}{2} \|x-x^* \|_2^2 \\
   \overset{\nabla f(x^*)=0}{\Rightarrow} f(x) - f(x^*) \le \frac{\beta}{2} \|x-x^* \|_2^2
   $$
   For $(a)$,
   $$
   f(x^*) \le f(y) \le f(x) + \left < \nabla f(x), y-x \right > + \frac{\beta}{2} \|y-x \|_2^2
   $$
   Minimize the quad. upper bound over $y$, find $\nabla f(x) + \beta (y-x) = 0 \Rightarrow y = x - \frac{1}{\beta} \nabla f(x)$. Now plug in this value of y we get $(a)$.
3. Co-coercivity
   If f is $\beta$-smooth: $\left < \nabla f(x) - \nabla f(y), x-y \right > \ge \frac{1}{\beta} \| \nabla f(x) - \nabla f(y) \|_2^2 $.
   To show this:
   $$
   f_x(z) = f(z) - \left < \nabla f(x), z \right > \quad z^* =x \  \text{is minimizer of} \ f_x(z) \\
   f_y(z) = f(z) - \left < \nabla f(y), z \right > \quad z^* =y \  \text{is minimizer of} \ f_y(z) \\
   f(y)-( f(x) + \left < \nabla f(x), y-x \right >) = f(y) - \left < \nabla f(x), y \right > - ( f(x) - \left < \nabla f(x), x \right > ) \\
   = f_x(y) - f_x(x) \overset{(a)}{\Rightarrow} \\ 
   \ge \frac{1}{2 \beta} \| \nabla f_x (y) \|_2^2 = \ge \frac{1}{2 \beta} \| \nabla f (y) - \nabla f (x) \|_2^2
   $$
   Similarliy, by flipping roles of $x,y$:
   $$
   f(x)-( f(y) + \left < \nabla f(y), x-y \right >) \ge \frac{1}{2 \beta} \| \nabla f (y) - \nabla f (x) \|_2^2
   $$
   Adding gives co-coricivity.

#### Properties of Strongly Convex Functions.
|函数$f(x)$ | 性质 |
|---------|----------|
| convex | $f(y) \ge f(x) + \left < \nabla f(x), y-x \right >$ | 
| $\beta$-smooth: $\| \nabla f(x) - \nabla f(y) \|_2 \le \beta \cdot \|x-y\|_2$ | $f(y) \le f(x) + \left < \nabla f(x), y-x \right > + \frac{\beta}{2} \|y-x \|_2^2$ | 
| $\alpha$-convex: $f(x)-\frac{\alpha}{2}\|x\|^2$ convex | $f(y) \ge f(x) + \left < \nabla f(x) , y-x  \right > + \frac{\alpha}{2} \|y -x \|_2^2$ | 
1. Bound on suboptimality of any point
   If f is $\alpha$-strongly convex: 
   $$
   \frac{\alpha}{2 } \| x-x^* \|_2^2 \overset{(a)}{\le} f(x) - f(x^*) \overset{(b)}{\le} \frac{1}{2 \alpha}  \| \nabla f(x) \|_2^2
   $$
   For both $(a)$ and $(b)$ we use quadratic upper bound
   $$
   f(x) \ge f(x^*) + \left < \nabla f(x^*),x-x^* \right > + \frac{\alpha}{2} \|x-x^* \|_2^2 \\
   \Rightarrow f(x) - f(x^*) \ge \frac{\alpha}{2} \|x-x^* \|_2^2 
   $$
   For $(b)$,
   $$
   f(x^*) \ge \min_y: f(x)+ \left < \nabla f(x) , y-x  \right > + \frac{\alpha}{2} \|y -x \|_2^2
   $$
   Take grad., set to zero: $\nabla f(x) + \frac{\alpha}{2}(y-x) = 0$, plugging in 
   $$
   f(x) - f(x^*) \le \frac{1}{2 \alpha} \| \nabla f(x) \|_2^2
   $$

2. Coericivity
   If f is $\alpha$-strongly convex: 
   $$
   \left < \nabla f(x) - \nabla f(y), x-y \right > \ge \alpha \| x - y \|_2^2
   $$
   Recall f is $\alpha$-s.c. if $g(x) = f(x) - \frac{\alpha}{2}\|x\|_2^2$ is convex. $g(x)$ convex $\Leftrightarrow$ $\nabla g(x)$ monotone.
   $$
   \left < \nabla g(x) - \nabla g(y), x-y \right > \ge 0 \\
   \left < \nabla f(x) - \nabla f(y) - \alpha(x-y), x-y \right > \ge 0 \\
   \Rightarrow \left < \nabla f(x) - \nabla f(y) , x-y \right > \ge \alpha \| x - y \|_2^2
   $$
### Convergence Rates
Goal: obtain bounds on sub-optimality of $x_t$: $f(x_k) - f(x^*)$. What does this gap look like as the function of $k$ the number of iterations.
#### Subgradient method
$$
x_{t+1} = x_t - \eta g_t, \ g_t \in \partial f(x_t)
$$
Let f be convex. Assume:$\forall x, \ \forall g_x \in \partial f(x), \| g_x \|_2 \le G$.
$$
\textcolor{blue}{ \| x_{t+1} - x^* \|_2^2 }= \| x_t - \eta g_t - x^* \|_2^2 = \\
\| x_t - x^* \|_2^2 - 2 \eta \textcolor{red}{\left <  g_t, x_t - x^* \right >} + \eta^2 \| g_t \|_2^2 \\
\overset{convexity}{\rightarrow} \le \textcolor{blue}{ \| x_t - x^* \|_2^2 } - 2 \eta \textcolor{red}{\left ( f(x_t) - f(x^*) \right )} + \eta^2 \textcolor{green}{G^2} \\
\Rightarrow \textcolor{red}{ f(x_t) - f(x^*) } \le \frac{1}{2 \eta} \big ( \underset{ \text{telescope once we sum over t} }{
\textcolor{blue}{ \| x_{t+1} - x^* \|_2^2 } - \textcolor{blue}{ \| x_t - x^* \|_2^2 } } \big ) + \frac{\eta}{2} \textcolor{green}{G^2}
$$
Then
$$
\frac{1}{T} \sum_{t=1}^T ( f(x_t) - f(x^*) ) \le \frac{1}{2 \eta} \frac{1}{T}  \big ( 
\textcolor{blue}{ \| x_{1} - x^* \|_2^2 } - \underbrace{ \textcolor{blue}{ \| x_T - x^* \|_2^2 } }_{\text{dropping this term}}  \big ) + \frac{\eta}{2} \textcolor{green}{G^2} 
$$
Claim
$$
f(\frac{1}{T} \sum x_t) - f(x^*) \le \frac{1}{T} \sum_{t=1}^T ( f(x_t) - f(x^*) )  
$$
Then
$$
f(\frac{1}{T} \sum x_t) - f(x^*) \le \frac{1}{2 \eta T} R^2 + \frac{\eta}{2} {G^2}  \\
\text{where} \ R^2 = \| x_{1} - x^* \|_2^2
$$
The best $\eta \sim \frac{1}{\sqrt T} $.
_Summary_
1. If we plan to run for T iterations, best step size $\eta \sim \frac{1}{\sqrt T}$.
2. Error after T iterations $\sim \frac{1}{\sqrt T} $. Or to have error $\epsilon$ need $\sim \textcolor{red}{\frac{1}{\epsilon^2}}$ iterations.
3. This is good news. Sub-gradient mehod produces $\epsilon$-opt. solution.
4. $\textcolor{blue}{\text{dimension-free}}$.
#### Gradient descent for smooth functions
$f(x)$ is a $\beta$-smooth, convex function
$$
x_{t+1} = x_t - \eta \nabla f(x_t) =  x_t - \frac{1}{\beta} \nabla f(x_t)
$$
Recall: 
$$
f(x_{t+1} ) \le f(x_t) - \frac{\eta}{2} \| \nabla f(x_t) \|_2^2 \ ( \text{ holds for any } \eta \le\frac{1}{\beta}) \\
\le \textcolor{blue}{ f(x^*) + \left < \nabla f(x_t), x_t - x^* \right > } - \frac{\eta}{2} \| \nabla f(x_t) \|_2^2 \\
= f(x^*) + \frac{1}{2 \eta} \big ( \|x_t-x^*\|_2^2 - \underbrace{ \|x_t-x^*- \eta \nabla f(x_t) \|_2^2}_{\|x_{t+1} - x^* \|_2^2} \big ) \\
= f(x^*) + \frac{1}{2 \eta} \big ( \underbrace{\|x_t-x^*\|_2^2 - \|x_{t+1} - x^* \|_2^2}_{\text{telescope once we sum}} \big )
$$
Then
$$
f(x_t) - f(x^*) \le \frac{1}{T}\sum ( f(x_t) - f(x^*) ) \le \frac{1}{T} \cdot \frac{1}{2 \eta} \cdot \|x_0 - x^* \|_2^2  \\
= \frac{1}{T} \big ( \frac{\beta}{2} \cdot R^2)
$$

Suboptimality scales like $\sim \frac{1}{T}$. For error $\epsilon \sim \textcolor{red}{\frac{1}{\epsilon}}$.

**Note**: use of the "self-tuning" properity of smooth function.
#### Gradient descent for smooth and strongly convex functions
Recall co-coericivity of smooth function: $\left < \nabla f(x) - \nabla f(y), x-y \right > \ge \frac{1}{\beta} \| \nabla f(x) - \nabla f(y) \|_2^2 $.
Assume f is $\alpha$-strongly convex and $\beta$-smooth. $f(x) - \frac{\alpha}{2} \|x\|_2^2$ is convex. Also this is $(\beta - \alpha)$ smooth (f is $\gamma$-smooth if $\frac{\gamma}{2} \|x\|_2^2-f(x)$ is convex).
Co-coericivity of $(f(x) - \frac{\alpha}{2} \|x\|_2^2)$ implies:
$$
\left < \nabla f(x) - \nabla f(y), x- y\right > \ge \alpha \|x-y\|_2^2  + \\
\frac{1}{\beta - \alpha} \| \nabla f(x) - \nabla f(y) \|_2^2 + \frac{\alpha^2}{\beta-\alpha} \|x-y\|_2^2 - \frac{2 \alpha}{\beta - \alpha}\left < \nabla f(x) - \nabla f(y), x- y\right >
$$
Simplifying, we find
$$
\left < \nabla f(x) - \nabla f(y), x- y\right >  \ge \frac{\alpha \beta}{\beta+\alpha} \|x-y\|_2^2 + \frac{1}{\alpha+\beta} \| \nabla f(x) - \nabla f(y) \|_2^2
$$
Take the stepsize $\eta =  \frac{2}{\alpha+\beta}, x_{t+1} = x_t - \eta \nabla f(x_t)$
$$
{ \| x_{t+1} - x^* \|_2^2 }=\| x_t - \eta \nabla f(x_t) - x^* \|_2^2 \\
= \| x_t - x^* \|_2^2 - 2 \eta \underbrace{ \textcolor{red}{\left <  \nabla f(x_t), x_t - x^* \right >}}_{\left <  \nabla f(x_t) - \nabla f(x^*), x_t - x^* \right >} + \eta^2 \| \nabla f(x_t) \|_2^2 
$$
Use the Co-coericivity of $ f(x) - \frac{\alpha}{2} \|x\|_2^2$ we get
$$
\left <  \nabla f(x_t) - \nabla f(x^*), x_t - x^* \right > \ge \frac{\alpha}{\alpha + \beta} \|x_t - x^* \|_2^2 + \frac{1}{\alpha + \beta} \| \nabla f(x_t) - \nabla f(x^*) \|_2^2
$$
Then plugging in 
$$
{ \| x_{t+1} - x^* \|_2^2 } \le \big( 1 - 2 \eta \frac{\alpha}{\alpha+\beta} \big) \| x_t - x^* \|_2^2 + \big ( \eta^2 - 2 \eta \frac{1}{\alpha+\beta} \big) \| \nabla f(x_t) \|_2^2 \\
\overset{\text{plug in }\eta} {\le} \big ( 1 - 2 \eta \frac{\alpha \beta}{\alpha+\beta} \big ) \| x_{t} - x^* \|_2^2 \\
\le \big ( 1 - 2 \eta \frac{\alpha \beta}{\alpha+\beta} \big )^t \cdot \| x_{1} - x^* \|_2^2 \\
\Rightarrow \| x_{t+1} - x^* \|_2 \le \big (\frac{\beta / \alpha - 1  }{ \beta / \alpha + 1 } \big )^t \| x_{1} - x^* \|_2
$$
$\kappa =  \beta / \alpha $ condition number.

_Summary_
f is $\alpha$-strongly convex, $\beta$-smooth
1. suboptimality $\sim C^T$, $C = (\frac{\kappa-1}{\kappa+1}) < 1$
2. For error $\epsilon \sim \text{log}(1/\epsilon)$ iterations.
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