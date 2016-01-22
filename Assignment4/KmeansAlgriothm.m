function [cluster,centroid] = KmeansAlgriothm(k,data)
len = length(data);
tmp=randperm(len);
index = tmp(1:k);
centroidX = data(index,1);
centroidY = data(index,2);
cluster = zeros(len,1);
% 随机选取k个点作为初始值
centroid = [centroidX,centroidY];
while 1
    % 保留原来的centroid
    old = centroid;
    % 计算每个点的distance
    for i = 1:len;
        distance = zeros(k,1);
        for j = 1:k
        distance(j) = norm(data(i,:)-centroid(j,:));
        end
        [~,ind] = min(distance);
        cluster(i,1) = ind;
    end
   % 更新centroid
   for m =1:k
       centroid(m,:)= mean(data(cluster==m,:));
   end    
   if (isequal(old,centroid))
         break;
   end
end
end

