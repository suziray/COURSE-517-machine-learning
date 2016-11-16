function preds=knnclassifier(xTr,yTr,xTe,k);
% function preds=knnclassifier(xTr,yTr,xTe,k);
%
% k-nn classifier 
%
% Input:
% xTr = dxn input matrix with n column-vectors of dimensionality d
% xTe = dxm input matrix with n column-vectors of dimensionality d
% k = number of nearest neighbors to be found
%
% Output:
%
% preds = predicted labels, ie preds(i) is the predicted label of xTe(:,i)
%

%% fill in code here
if(isequal(xTr,xTe)) % if it is that simple...
    preds=yTr;
else
    [I,~]=findknn(xTr,xTe,k); % get the indices of the k nearest points
    preds=yTr(I); % assume k=1
    n=size(xTe,2); % get the number of testing data points
    p0=preds;
    if(k>1)
        [preds,~,c] = mode(yTr(I));
        for i=1:n
            drawVector=c(i);
            j = k;
            while(size(drawVector{1},1)~=1 && j>k*5/12)
                j=int64(j/3);
                j=randperm(j)+j-1;
                if(n>1)
                    [preds(i),~,drawVector]=mode(p0(1:j,i));
                else
                    [preds(i),~,drawVector]=mode(p0(1:j)');
                end;
            end;
        end;
    end;
end;