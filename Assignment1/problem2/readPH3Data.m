function readPH3Data(loadPath,thetaDataPath )
fid = fopen(loadPath,'rt');
fileID = fopen('tempTxtName.txt','w');
tempX = [];
while 1
   tempLine = fgetl(fid);
   if ~ischar(tempLine), break, end
   if strfind(tempLine,'POINT'),
      if strfind(tempLine,'TEST'),  
      else
         tempLine = tempLine(8:end),
         fprintf(fileID,'%s\n',tempLine),
      end
   end
end
fclose('all');
temp = importdata('tempTxtName.txt');
for i = 1:8
    for j = 1:5
        tempX = [tempX temp(i,j)];
    end
end
disp(tempX);
delete('tempTxtName.txt');
save(thetaDataPath,'tempX');
end

