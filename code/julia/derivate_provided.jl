
using Ipopt

function eval_f(x)  
    f = x[1]^2 - 0.5*x[1] -x[2] - 2
    return f
end

function eval_g(x, g)
    g[1] = x[1]^2 - 4*x[1] + x[2] + 1
    g[2] = 0.5*x[1]^2 + x[2]^2 - x[1] - 4
    return nothing
end

function eval_df(x, df)
    df[1] = 2*x[1] - 0.5
    df[2] = -1.0
    return nothing
end

# dg[1,1]
# dg[1,2]
# dg[2,1]
# dg[2,2]

function eval_dg(x, mode, rows, cols, values)
    if mode == :Structure
        rows[1] = 1 
        rows[2] = 2
        rows[3] = 1
        rows[4] = 2
        cols[1] = 1
        cols[2] = 1
        cols[3] = 2
        cols[4] = 2
    else
        values[1] = 2*x[1] - 4 # 1,1
        values[2] = x[1] - 1 # 2,1
        values[3] = 1.0 # 1,2
        values[4] = 2*x[2] # 2,2
    end
    return nothing
end

nx = 2
lx = -5*ones(nx)
ux = 5*ones(nx)

ng = 2
lg = -Inf*ones(nx)
ug = zeros(nx)

nzJ = 4
nzH = 0

prob = createProblem(nx, lx, ux, ng, lg, ug, nzJ, nzH, eval_f, eval_g, eval_df, eval_dg)
addOption(prob, "hessian_approximation", "limited-memory")

# Set starting solution
prob.x = ones(nx)

# solve
status = solveProblem(prob)

# println(Ipopt.ApplicationReturnStatus)
println(prob.x)
println(prob.obj_val)