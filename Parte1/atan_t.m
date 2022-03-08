#Function that computes arctan(x) 
#parameters: 
  # @x : preimage
#output: result of the operation arctan(x)
function [result] = atan_t(x)
  tol = 1e-8; # generic tolerance defined for the package
  iterMax = 2500; # generic maximum iterations defined for the package
  a = x;
  
  function [s_k] = get_S_k(n)
    s_k = (-1)^n * a^(2*n+1) * div_t(2*n+1); # defined succession for aproximation
  endfunction
  
  s_k = get_S_k(0); #initial S_0
  for n = 1 : iterMax -1
      s_kp1 = s_k + get_S_k(n); #sum of last value and new value of the iteration
      error = abs(s_kp1 - s_k); # error calculation
      s_k = s_kp1
      if (error < tol ) # stopping condition
        break;
      endif
    endfor
  result = s_k;
  endfunction