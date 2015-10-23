function readPARData( dataPath,filiterName,matName )
txtName = 'temp.txt';
fid = fopen(dataPath);
fileID = fopen(txtName,'w');
while 1
   tempLine = fgetl(fid);
   if ~ischar(tempLine), break, end
   if strfind(tempLine,filiterName),
   fprintf(fileID,'%s\n',tempLine),
   end
end
fclose('all');
temp  = importdata(txtName);
A = temp.data; 
a = A(:,3);
b = A(:,5);
c = A(:,9);
save(matName,'a','b','c');
delete(txtName);
end

