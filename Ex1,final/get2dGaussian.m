function g = get2dGaussian(sigma)

M = 3*sigma;
N = 3*sigma;
m = floor(M/2);
n = floor(N/2);
g = zeros(M,N);
for i = 1:M
    for j = 1:N
        g(i,j)= 0.5/pi/sigma/sigma*exp(-0.5/sigma/sigma*((i-m-1)^2+(j-n-1)^2));
    end
end
%normalization
g = g/sum(sum(g));

end