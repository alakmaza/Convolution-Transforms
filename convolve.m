function c = convolve(a,b)
    c = zeros(1,(length(a) + length(b) - 1));
    index = 1:length(b);
    
    for i = 0:(length(a)-1);
    c(index+i) = c(index+i) + b*a(1+i);
    end
end
