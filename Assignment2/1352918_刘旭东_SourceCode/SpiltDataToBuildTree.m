function [M] = SpiltDataToBuildTree()
%SPILTDATATOBUILDTREE to split the iris_data 
fImportId = fopen('iris_data.txt');
fOutputId = fopen('temp.txt','w');
while 1 
   eachLine = fgetl(fImportId);   
   if ~ischar(eachLine), break,end
  
   if strfind(eachLine,'Iris-setosa'),
    eachLine  = strrep(eachLine,'Iris-setosa','1'),
   end
   if strfind(eachLine,'Iris-versicolor'),
    eachLine  = strrep(eachLine,'Iris-versicolor','2'),
   end
   if strfind(eachLine,'Iris-virginica'),
    eachLine  = strrep(eachLine,'Iris-virginica','3'),
   end
   fprintf(fOutputId,'%s\n',eachLine),
end
M = dlmread('temp.txt', ',');

fclose('all');
delete('temp.txt');
end

