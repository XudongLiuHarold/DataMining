function [cluster,centroid] = KmeansAlgriothm(k,data)
len = length(data);
tmp=randperm(len);
index = tmp(1:k);
centroidX = data(index,1);
centroidY = data(index,2);
cluster = zeros(len,1);
% ���ѡȡk������Ϊ��ʼֵ
centroid = [centroidX,centroidY];
while 1
    % ����ԭ����centroid
    old = centroid;
    % ����ÿ�����distance
    for i = 1:len;
        distance = zeros(k,1);
        for j = 1:k
        distance(j) = norm(data(i,:)-centroid(j,:));
        end
        [~,ind] = min(distance);
        cluster(i,1) = ind;
    end
   % ����centroid
   for m =1:k
       centroid(m,:)= mean(data(cluster==m,:));
   end    
   if (isequal(old,centroid))
         break;
   end
end
end

