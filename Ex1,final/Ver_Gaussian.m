function Gv= Ver_Gaussian(sigma)

M = 3*sigma;
m = floor(M/2);
Gv = zeros(M,1);

for i = 1:M
       Gv(i,1)= 1/sigma/sqrt(2*pi)*exp(-0.5/sigma/sigma*((i-m-1)^2));
end
%normalization
Gv = Gv/sum(Gv);
end