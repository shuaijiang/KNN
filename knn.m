%K-Nearest Neighbor(KNN)

%Author: shuaijiang
%Email: zhaoshuaijiang8@gmail.com
%date: 20141024

clear all;

%%%%% Setting %%%%%
k  = 5;
male_sample_num   = 50;
female_sample_num = 50;
sample_num        = male_sample_num + female_sample_num;
test_num          = 35;

male_train_file   = 'male.txt';
female_train_file = 'female.txt';
test_file = 'test0.txt';

train_data  = zeros(sample_num,2);
train_label = zeros(sample_num,1);  %male:1, female:0
test_data   = zeros(test_num,3); 
distance = zeros(test_num,sample_num);
%%%%% Setting %%%%%

%%%%% Load Data %%%%%
[fid1,message1] = fopen(male_train_file,'r');
[fid2,message2] = fopen(female_train_file,'r');
if fid1>0 && fid2>0
    male   = fscanf(fid1,'%g',[2,50])';
    female = fscanf(fid2,'%g',[2,50])';
else
    disp(message1);
    disp(message2);
    return;
end
train_data(1:male_sample_num,:)      = male;
train_label(1:male_sample_num,:)     = 1;
train_data(male_sample_num+1:end,:)  = female;
train_label(male_sample_num+1:end,:) = 0;
%%%%% Load Data %%%%%

%%%%% Load the Test Data %%%%%
[fid,message] = fopen(test_file,'r');
if fid>0
    test_data   = fscanf(fid,'%g',[3,50])';
else
    disp(message);
    return;
end
%%%%% KNN %%%%%
%%%%% Test: Make the Decision %%%%%
right = 0;
wrong = 0;
for i=1:test_num
    for j=1:sample_num
        distance(i,j) = sqrt(sum((test_data(i,1:2)-train_data(j,:)).^2));
    end
    
    male_count   = 0;
    female_count = 0;
    for j=1:k
        [value,index] = min(distance(i,:));
        distance(i,index) = NaN;
        gender = train_label(index);
        if(gender == 1)
            male_count = male_count + 1;
        else
            female_count = female_count + 1;
        end
    end
    if(male_count > female_count)
        fprintf('male\n');
        if test_data(i,3) == 1
            right = right + 1;
        else
            wrong = wrong + 1;
        end
    else
        fprintf('female\n');
        if test_data(i,3) == 0
            right = right + 1;
        else
            wrong = wrong + 1;
        end
    end
end
accauary = right/(right+wrong);
fprintf('right=%d\nwrong=%d\naccauary=%g',right, wrong, accauary);

