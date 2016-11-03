function Gh = Hor_Gaussian(sigma)

N = 3*sigma;
n = floor(N/2);
Gh = zeros(1,N);

for j = 1:N
       Gh(1,j)= 1/sigma/sqrt(2*pi)*exp(-0.5/sigma/sigma*((j-n-1)^2));
end
%normalization
Gh = Gh/sum(Gh);
end
