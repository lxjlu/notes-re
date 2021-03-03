
function structure(x,params)
    mass = ( 1-x[1] )^2 + params[1]*( x[2] - x[1]^2 )^2;
    stress = [x[1]^2+x[2]^2; x[1] + params[2]*x[2]];
    # sleep(1.0);
    return mass, stress
end