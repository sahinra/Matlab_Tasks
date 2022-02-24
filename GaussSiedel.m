function [result] = GaussSiedel

n =3;
tolerance = input('Enter the tolerance: ');
maxIteration = input('Enter the maximum number of iteration: ');

A1 = [4 5 8]; %main diagonal
A2 = [3 3]; %upper diagonal of main diagonal 
A3 = [2 2]; %lower diagonal of main diagonal
b = [8 -14 27];
x = [0 0 0]; %initial value

iteration = 1;
while iteration <= maxIteration
    error = 0;
    for i = 1:n        
        number = 0;
        
        if i == 1
            number = number + A1(i)*x(i) + A2(i)*x(i);                 
        elseif i == n
            number = number + A3(i - 1)*x(i)+ A1(i)*x(i);
        else   
            number = number + A3(i - 1)*x(i)+ A1(i)*x(i) + A2(i)*x(i);
        end
           
        xI = A1(i);
        number = ( b(i) - number)/xI;
        if absoluteVal(number) > error
            error = absoluteVal(number);
        end
        x(i) = x(i) + number; 
    end
    if error <= tolerance
        break;
    else
        iteration = iteration +1;
    end
end
fprintf('The result after %g iterations is  \n', iteration - 1);
result = x;
end

function [value] = absoluteVal(a)
    if a >= 0
        value = a;
    else
        value = -a;
    end
end