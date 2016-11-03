function im_output = convIm(im,mask,border)
%% Input
[nx, ny] = size(im);
[M,N] = size(mask);
m = floor(M/2);
n = floor(N/2);
im_output = zeros(nx,ny);

%% compute the convolution

for x = 1+m:nx-m
    for y = 1+n:ny-n    
        for i = -m : m
            for j = -n : n
                im_output(x,y)= im_output(x,y)+mask(i+m+1,j+n+1)*im(x-i,y-j);
            end
        end
    end
end
%% recover boundary
if(border == 1)
    % mirror Boundary
    for x = 1:m
        im_output(x,:) =  im_output((m+1)+((m+1)-x),:); 
    end
    for x = nx-m+1:nx
        im_output(x,:) =  im_output((nx-m)-(x-(nx-m)),:); 
    end
    for y = 1:n
        im_output(:,y) =  im_output(:,(n+1)+((n+1)-y)); 
    end
    for y = ny-n+1:ny
        im_output(:,y) =  im_output(:,(ny-n)-(y-(ny-n))); 
    end
else
    % clamp
    for x = 1:m
        im_output(x,:) =  im_output(m+1,:); 
    end
    for x = nx-m+1:nx
        im_output(x,:) =  im_output(nx-m,:); 
    end
    for y = 1:n
        im_output(:,y) =  im_output(:,n+1); 
    end
    for y = ny-n+1:ny
        im_output(:,y) =  im_output(:,ny-n); 
    end
end
end
