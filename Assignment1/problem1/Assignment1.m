%get user's input 
%To make the program stronger, add input check.
i=input('Please give the first parament i:   ','s');
i = isInt(i);

j=input('Please give the second parament j:  ','s');
j = isInt(j);

prompt = 'What is the subject ?\n 1, Chinese 2, Englsih 3, Math\n';
subject = input(prompt,'s');
subject = isInt(subject);
while subject >3 || subject<1 ,
    subject = input('Invaild input, please choose number from 1,2,3:   ','s');
    subject = isInt(subject);
end

% use i,j subject get a,b,c and theta.
load('data_prob1.mat');
[~,~] = size('data');
a = data(subject).par(j,1);
b = data(subject).par(j,2);
c = data(subject).par(j,3);
theta = data(subject).theta(i);
disp('a[j],b[j],c[j],theta[i] equals:  ');
disp(a);
disp(b);
disp(c);
disp(theta);

% call the model function:
p = ModelFunc(a,b,c,theta);

%return the results:
disp('the result p(i,j) is :');
disp(p);