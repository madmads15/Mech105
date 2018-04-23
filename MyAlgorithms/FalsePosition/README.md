# False Position Algorithm

This algorithm estimates the root of any given function by using the False Position Method.

## Inputs
### The minimum number of inputs is 3 (func, Xl, Xu) and the ither inputs are optional and have default values.

func - the function that you want to find the root of

Xl - the lower guess

Xu - the upper guess

es - the desired relative error (default set to 0.0001% if not given an input)

maxiter - the desired number of iterations (default set to 200 if not given an input)

## Outputs

root - the estimated root location

fx - the function evaluated at the root location

ea - the approximate relative error given in a percentage

iter - the number of performed iterations
