%% Implement data 
M = SpiltDataToBuildTree();

%% Training 
Y = M(:,end);
% ...based on the others
X = M(:,3:4);
Mdl = fitcnb(X,Y);

%% Plot Tree
figure
gscatter(X(:,1),X(:,2),Y);
h = gca;
xylim = [h.XLim h.YLim]; % Get current axis limits
hold on
Params = cell2mat(Mdl.DistributionParameters);
Mu = Params(2*(1:3)-1,1:2); % Extract the means
Sigma = zeros(2,2,3);
for j = 1:3
    Sigma(:,:,j) = diag(Params(2*j,:)); % Extract the standard deviations
    ezcontour(@(x1,x2)mvnpdf([x1,x2],Mu(j,:),Sigma(:,:,j)),...
        xylim+0.5*[-1,1,-1,1]) ...
        % Draw contours for the multivariate normal distributions
end
title('Naive Bayes Classifier -- Fisher''s Iris Data')
xlabel('Petal Length (cm)')
ylabel('Petal Width (cm)')
hold off

