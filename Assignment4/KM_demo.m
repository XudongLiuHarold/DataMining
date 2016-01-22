%% Import data
data = importdata('s4.txt');
k = 7;
%% cluster by my kmeans
[cluster,centroid] = KmeansAlgriothm(k,data);
%% cluster by system kmeans
[idc,c] = kmeans(data,k);
%% Plot the result
hFig = figure('numbertitle','off','name','Kmeans Algorithm','color','white');
set(hFig,'Position',[100,100,1600,1000]);

subplot(1,2,1);
for m =1 : k 
   plot(data(cluster==m,1),data(cluster==m,2),'.','MarkerFaceColor',[1/m,0,1/m],'MarkerSize',14);
   hold on;
end
   plot(centroid(:,1),centroid(:,2),'kx','MarkerSize',14,'LineWidth',3);
   voronoi(centroid(:,1),centroid(:,2));
   title('My K-Means Algorithm','FontSize',17,'FontWeight','bold');
   hold off; 

subplot(1,2,2);
for i =1 : k 
   plot(data(idc==i,1),data(idc==i,2),'.','MarkerFaceColor',[1/i,0,1/i],'MarkerSize',14);
   hold on; 
end
  plot(c(:,1),c(:,2),'kx','MarkerSize',14,'LineWidth',3);
 voronoi(c(:,1),c(:,2));
  title('System K-Means Algorithm','FontSize',17,'FontWeight','bold');
  hold off;
