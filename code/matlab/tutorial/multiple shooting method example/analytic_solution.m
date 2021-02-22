%--------------------------------------------------------------------------
% The analytic solution can be found at Applied Optimal Control: Optimization,
% Estimation, and Control - Bryson, A E and Y-C Ho.
%--------------------------------------------------------------------------

function [x_opt,u_opt] = analytic_solution(t,l)
    u_opt = zeros(length(t), 1);
    x_opt = zeros(length(t), 2);
    for i = 1:length(t)
        
        if (t(i) <= 3*l)
            u = -2/(3*l)*(1-t(i)/(3*l));
            v = (1 - t(i)/(3*l)).^2;
            x = l*(1 - (1 - t(i)/(3*(l))).^3);
            
        elseif (t(i) >= 1-3*l)
            u = -2/(3*l)*(1 - (1-t(i))/(3*l));
            v = -(1 - (1-t(i))/(3*l)).^2;
            x = l*(1 - (1 - (1-t(i))/(3*(l))).^3);
        else
            u = 0;
            v = 0;
            x = l;
        end
        
    u_opt(i,:) = u;
    x_opt(i,:) = [x, v];
    
    end
end