function [x,residual,t1 ]= gaussandbackwardsubstitution(Atemp,btemp)
AAtemp=Atemp;
bbtemp=btemp;
timer=tic;
nntemp=max(size(Atemp));
%高斯消去法 
   for k=1:nntemp-1 
    [m,j]=max(abs(Atemp(k:nntemp,k))); 
    Atemp([k,k+j-1],:)=Atemp([k+j-1,k],:);
    t= Atemp(k+1:nntemp,k)/Atemp(k,k); 
    Atemp(k+1:nntemp,k) = 0;
    Atemp(k+1:nntemp,k+1:nntemp)=Atemp(k+1:nntemp,k+1:nntemp)-t*Atemp(k,k+1:nntemp);
     btemp(k+1:nntemp)=btemp(k+1:nntemp)-btemp(k)*t;
   end

%backward substitution
x=zeros(nntemp,1);
for i=nntemp:-1:2
x(i)=btemp(i)/Atemp(i,i);
btemp(1:i-1) = btemp(1 : i - 1) - x(i)*Atemp(1 : i - 1, i);
end
x(1) = btemp(1)/Atemp(1, 1);
t1=toc(timer);
residual=norm(AAtemp*x - bbtemp);
end
