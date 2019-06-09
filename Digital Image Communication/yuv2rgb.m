function [rgb1]=yuv2rgb(y,u,v) 

newu=imresize(u,size(y),'nearest'); 
newv=imresize(v,size(y),'nearest'); 

r1=zeros(size(y)); 
g1=r1; 
b1=r1; 

r1=y+1.371*newv-175.488; 
g1=y-0.698*newv-0.336*newu+132.352; 
b1=y+1.732*newu-221.696; 

rgb1=zeros(size(y,1),size(y,2),3); 
rgb1(:,:,1)=r1; 
rgb1(:,:,2)=g1; 
rgb1(:,:,3)=b1; 
rgb1=uint8(rgb1); 
end