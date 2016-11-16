function output=analyze(kind,truth,preds)	
% function output=analyze(kind,truth,preds)		
%
% Analyses the accuracy of a prediction
% Input:
% kind='acc' classification error
% kind='abs' absolute loss
% (other values of 'kind' will follow later)
% 

switch kind
	case 'abs'
		% compute the absolute difference between truth and predictions
		output=sum(abs(truth-preds))/size(truth,2);
		
	case 'acc' 
		%% fill in code here
		output=1-nnz(truth-preds)/size(truth,2);
end;

