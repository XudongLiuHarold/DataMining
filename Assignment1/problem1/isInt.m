function retval = isInt(val)
    [val, status] = str2num(val);
while ~status || ~isscalar(val) || val ~= floor(val)
  val = input('Invalid input. Please input an integer, try again: ', 's');
  [val, status] = str2num(val);
end
 retval = val;
end

