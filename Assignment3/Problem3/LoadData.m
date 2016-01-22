function [x,label,term] =  LoadData(Path)
flength = fopen(Path);
fload = fopen(Path);
length = 1;
while 1
    eachLine = fgetl(flength);   
   if ~ischar(eachLine), break,end 
    length = length +1;
end
term = {};
x = zeros(int32(length/2)+1,300);
label = zeros(int32(length/2)+1,1);
length = 1;
while 1
    eachLine = fgetl(fload);   
   if ~ischar(eachLine), break,end 
   eachLine =deblank(eachLine);  
   if(mod(length,2) == 0)
       Stemp = regexp(eachLine,'\s+','split');
      [~,m]=size(Stemp);
      for j = 1:m  
           if ~ismember(Stemp{j},term) 
             term{size(term,1)+1,1} = Stemp{j};   
            else  
              [~,loc] = ismember(Stemp{j},term) ;
              x(length/2,loc) = x(length/2,loc) +1 ;
           end
      end
   else
       if strcmp(eachLine,'true')
           label((length+1)/2) = 1;
       else 
           label((length+1)/2) = 0;
       end
   end
      length = length+1;
end
fclose('all');
end

