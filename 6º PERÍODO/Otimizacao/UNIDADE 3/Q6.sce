function z = f(x,y)
    
    z = x.^2 + y.^2 + 3*x*y + 6*x + 19*y;
endfunction

function w = g(x,y)
    
    w = 3*y + x - 5;
endfunction


x = linspace(-1,1,1000); 

y = linspace(-2,2,2000); 

z = feval(x,y,f)';
w = feval(x,y,g)';

clf

surf(x,y,z);
surf(x,y,w);
