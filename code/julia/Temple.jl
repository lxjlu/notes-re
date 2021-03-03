#=
* parameters
* objective and constraints in one function 
* post-processing
* options
=#
using NLPModels: ADNLPModel
using NLPModelsIpopt: ipopt
include("structure.jl")

function runoptimization(x0, nc, params, stressmass,lb, ub)

    xlast = 2*x0;
    flast = 0.0;
    glast = zeros(nc)
    objvec = [];

    function common(x)
        mass, stress = structure(x, params);
        f = mass;
        g = stress - stressmass;
        return f, g    
    end

    objcon(x) = common(x)

    function objcon(x::Vector{Float64})
        f, g = common(x)
        objvec = [objvec; f]
        return f, g
    end



    function obj(x) 
        # if !isequal(x, xlast)
            flast, glast = objcon(x)
            # xlast = x
        # end
        return flast
    end

    function con(x) 
        # if !isequal(x, xlast)
            flast, glast = objcon(x)
            # xlast = x
        # end
        return glast
    end

    
    model = ADNLPModel(obj, x0, lb, ub, con, [-Inf, -Inf], [0.0, 0.0]);
    output = ipopt(model);
    xstar = output.solution;
    fstar = output.objective;

    return xstar, fstar, objvec
 
end

params = [100.0, 3.0];
stressmass = [1.0, 5.0];
x0 = [3.0, 4.0];
nc = 2;
lb = [0.0, 0.0];
ub = [10.0, 10.0];
xstar, fstar, objvec = runoptimization(x0, nc, params, stressmass, lb, ub);

using PyPlot
pygui(true)
figure()
semilogy(objvec)