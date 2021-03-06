#Function that computes the inverse of a number: x^1
#parameters: 
  # @x
#output: result of the operation x^-1
#restrictions: x must be different than zero and abs(x) can't be greater than factorial(100)
function [result] = div_t(x)
  tol = 1e-8; # generic tolerance defined for the package
  iterMax = 2500; # generic maximum iterations defined for the package
  a = x;
  is_negative = false;
  if a < 0
    a = abs(a);
    is_negative = true; # handle sign
  end

  #Function that returns x0 based on the value of @a
  #parameters:
    # @a
  #output: @x0
  function [x0]=get_x0 (a)
    if and(factorial(0) <= a, a <= factorial(20))
      x0 = eps^2;
    elseif and(factorial(20) < a, a <= factorial(40))
      x0 = eps^4;
    elseif and(factorial(40) < a, a <= factorial(60))
      x0 = eps^8;
    elseif and(factorial(60) < a, a <= factorial(80))
      x0 = eps^11;
    elseif and(factorial(80) < a, a <= factorial(100))
      x0 = eps^15;
    endif
  endfunction
  
  if (a == 0)
    error('x value can`t be zero'); # non zero value validation
    return;
  elseif (a > factorial(100))
    error('can`t support abs(x) greater than factorial(100)'); # max denominator validation 
    return;
  else
    x_k = get_x0(a); #define initial x value
    for k = 0 : iterMax -1
      x_kp1 = x_k * (2 - a * x_k); # defined succession for aproximation
      error = abs(x_kp1 - x_k); # error calculation
      x_k = x_kp1;
      if (error < tol * abs(x_kp1)) # stop condition
        break;
      endif
    endfor
    if is_negative
      result = -1 * x_kp1;
    else
      result = x_kp1;  
    end
  endif
endfunction
