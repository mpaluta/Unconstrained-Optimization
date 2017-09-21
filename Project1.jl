function unconstrained_optimization(f,x0,maxEvaluations)
    # Uses Newton's method for n-dimensional function
    # referenced lecture notebooks from lectures 3 and 4

    dimension=length(x0);
    x=zeros(dimension,1);
    x=x0;
    func_calls=0;
    min=f(x);
    func_calls+=1;

    while func_calls<maxEvaluations-2*dimension-dimension*3-dimension*(dimension-1)*4-1
        # had to subtract things above to accomodate the test software, even though my code double-
        # checks it below. Gradient used 2*n evals, Hessian has more complicated numbers, plus one more below
        grad, func_calls = gradFunc(f,x,func_calls)
        hess, func_calls = hessianFunc(f,x,func_calls)
        x=x-inv(hess)*grad;
        new=f(x);
        func_calls+=1;
        if func_calls<maxEvaluations # don't overwrite if exceeded limit during this loop iteration
            if new<min
                min=new;
            end
        end
    end
    return min
end

function gradFunc(f,x,func_calls)
    step=.00001;
    dimension=length(x)
    grad=zeros(dimension);
    for i=1:dimension;
        increment=zeros(dimension);
        increment[i]=step;
        x_eval1=x+increment;
        x_eval2=x-increment;
        grad[i]=(f(x_eval1)-f(x_eval2))/(2.0*step);
        func_calls=func_calls+2;
    end
    return grad, func_calls
end

function hessianFunc(f,x,func_calls)
    step=.00001;
    dimension=length(x);
    hess=zeros(dimension,dimension);
    for i=1:dimension;
        for j=1:dimension
            # Referenced Wikipedia "Finite Difference" page for second derivative formulae
            # Main diagonal terms have different formula than off-diagonal terms
            if i==j
                increment=zeros(dimension);
                increment[i]=step;
                x_eval1=x+increment;
                x_eval2=x-increment;
                hess[i,j]=(f(x_eval1)-2.0*f(x)+f(x_eval2))/(step^2);
                func_calls=func_calls+3;
            else
                increment1=zeros(dimension);
                increment2=zeros(dimension);
                increment1[i]=step;
                increment2[j]=step;
                x_eval3=x+increment1+increment2;
                x_eval4=x+increment1-increment2;
                x_eval5=x-increment1+increment2;
                x_eval6=x-increment1-increment2;
                hess[i,j]=(f(x_eval3)-f(x_eval4)-f(x_eval5)+f(x_eval6))/(4.0*step^2);
                func_calls=func_calls+4;
            end
        end
    end
    return hess, func_calls
end
