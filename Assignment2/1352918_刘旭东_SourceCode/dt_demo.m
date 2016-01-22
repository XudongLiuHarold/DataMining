%% Load the auto data
%import data 
M = SpiltDataToBuildTree();
Random = randperm(length(M));
TrainingSet = zeros(length(M)/2,5);
TestingSet =  zeros(length(M)/2,5);

for i = 1:2:length(M)
   TrainingSet(i,:) = M(i,:);
   TestingSet(i,:) = M(i+1,:);
end

%We want to predict the first column...
Y = TrainingSet(:,end);
% ...based on the others
X = TrainingSet(:,1:end-1);
cols = {'SepalLength', 'SepalWidth', 'PetalLength', 'PetalWidgth'};

%% Build the decision tree
t = build_tree(X,Y,cols);

%% Display the tree

hFig = figure('numbertitle','off','name','Decision Tree','color','white');
set(hFig,'Position',[0,0,1500,800]);
treeplot(t.p');
tree = t.p';
title('Decision tree ("**" is an inconsistent node)','FontSize',17,'FontWeight','bold');
[xs,ys,h,s] = treelayout(t.p');
for i = 2:numel(t.p)
	% Get my coordinate
	my_x = xs(i);
	my_y = ys(i);

	% Get parent coordinate
	parent_x = xs(t.p(i));
	parent_y = ys(t.p(i));

	% Calculate weight coordinate (midpoint)
	mid_x = (my_x + parent_x)/2;
	mid_y = (my_y + parent_y)/2;

    % Edge label
	text(mid_x,mid_y,t.labels{i-1},'HorizontalAlignment','center','FontWeight','Bold','FontSize',15,'Clipping','on','EraseMode','none');
    % Leaf label
    if ~isempty(t.inds{i})
        val = Y(t.inds{i});
        if numel(unique(val))==1
            classLabel = TranferToClassName(val(1));
            text(my_x, my_y, sprintf('%s\nn=%d', classLabel, numel(val)),'HorizontalAlignment','center','FontWeight','Bold','FontSize',15,'Clipping','on','EraseMode','none');
        else
            %inconsistent data
            text(my_x, my_y, sprintf('**y=%2.2f\nn=%d', mode(val), numel(val)),'HorizontalAlignment','center','FontWeight','Bold','FontSize',15,'Clipping','on','EraseMode','none');
        end
    end
end

%% Testing Tree
prediction = Predict(TestingSet(:,1:end-1));
correct = 0;
for i = 1:length(prediction)
    if TestingSet(i,end) == prediction(i);
        correct = correct +1;
    end
end
Accuracy = correct / length(prediction);
disp('The ID3 Decision Tree Accuracy:');
disp(Accuracy); 


tree1 = fitctree(X,Y);
view(tree1,'Mode','graph');
prediction1 = predict(tree1, TestingSet(:,1:end-1));
correct1 = 0;
for i = 1:length(prediction1)
    if TestingSet(i,end) == prediction1(i);
        correct1 = correct1 +1;
    end
end
Accuracy1 = correct1 / length(prediction1);
disp('The CART Decision Tree Accuracy:');
disp(Accuracy1); 
