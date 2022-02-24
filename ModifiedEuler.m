function [] = ModifiedEuler(f,x0,xn,y0,z0,h,a,b,c,d,func1,func2)
% y' = f(x,y) and z' = f(x,z)
% x0,y0,z0 denotes the inital values and xn is the final value
% h is the step length
% a,b,c,d are the coefficients of the two systems of equations
% func1 and func2 will be specified by the user and represesnts the two
% ordinary system of equations

while x0<=xn
    RHS1 = func1(x0,y0,z0);
    RHS2 = func2(x0,y0,z0);
    [y,z] = solve(a,b,c,d,RHS1,RHS2);
    x1 = x0 + h;
    y1 = y0 + f(x0 + h/2, y0 + f(x0,y0)*(h/2))*h;
    z1 = z0 + f(x0 + h/2, z0 + f(x0,z0)*(h/2))*h;
    y0 = y1;
    z0 = z1;
    x0 = x1;
    fprintf('\nx: %4.3f   y: %4.3f   z: %4.3f ',x0,y0,z0);%values of x,y and z
    fprintf('\n and the solution of the system y'': %4.3f  and z'': %4.3f \n',y,z);
end
end

function [A,B] = solve(a,b,c,d,RHS1,RHS2)
    % We solve for two systems of equations of two unknowns
    % aA + bB = RHS1
    % cA + dB = RHS2
    % A and B denote A = y' and B = z', namely two functions that we have in
    % our two systems of equations.
    % a,b,c,d are the coefficients and the results are RHS1 and RHS2
    % To solve the system we can multiply the 1.row with -c and 2.row with a. 
    % aA + bB = RHS1 => multiplied by -c
    % cA + dB = RHS2 => multiplied by a
    % Then solve for B, after that plug B in the 1. equation and find A.
    
    B = (-c*RHS1 + a*RHS2)/(-c*b + a*d);
    A = (RHS1 - b*B) / a;
end

