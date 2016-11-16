function D=l2distance(X,Z)
% function D=l2distance(X,Z)
%	
% Computes the Euclidean distance matrix. 
% Syntax:
% D=l2distance(X,Z)
% Input:
% X: dxn data matrix with n vectors (columns) of dimensionality d
% Z: dxm data matrix with m vectors (columns) of dimensionality d
%
% Output:
% Matrix D of size nxm 
% D(i,j) is the Euclidean distance of X(:,i) and Z(:,j)
%
% call with only one input:
% l2distance(X)=l2distance(X,X)
%

if (nargin==1) % case when there is only one input (X)
	[~,n]=size(X); % dimension of X
    S=repmat(diag(innerproduct(X)),1,n);
    G=innerproduct(X);
    R=repmat(transpose(diag(innerproduct(X))),n,1);
    D=sqrt(S-2*G+R);

else  % case when there are two inputs (X,Z)
    [~,n]=size(X); % dimension of X
    [~,m]=size(Z); % number of input vectors in Z
    S=repmat(diag(innerproduct(X)),1,m);
    G=innerproduct(X,Z);
    R=repmat(transpose(diag(innerproduct(Z))),n,1);
    D=sqrt(S-2*G+R);

end;
%



