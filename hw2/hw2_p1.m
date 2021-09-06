
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name of the script: hw2_p1
% Assignment submission


%Name: Linh Tang

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; clear all; close all;

%% Part 1

% Description: this script returns the submission date based on the
% assignment date and duration
% Input:  Assignment date(DD/MM/YYYY) and duration of the homework
% Output: The date a student finish that homework
% Method: Using if-else, mod() and floor () functions

fprintf("Input the date a student's homework was assigned.\n");
% Getting all the inputs and checking validity

% Day
get_d = input('Enter day: ', 's');
day = str2double(get_d); %converting string to number

% Input for day only contains numbers
if (isnan(day))
    error ('Invalid input. Only numbers for day.');
elseif (contains(get_d,'.')||contains(get_d,',')|| contains(get_d,'+'))
    error ('Invalid input. Only numbers for day.');
end  

% Day is from 1-30, assuming 30 days for every months
if (day <1 || day > 30)
    error ('Invalid day input. Day shoulbe be 1-30\n');  
end

% Month
get_m = input('Enter month: ','s');

month = str2double(get_m); %converting string to number

% Input for month only contains numbers
if (isnan(month))
    error ('Invalid input. Only numbers for month.');
elseif (contains(get_m,'.')||contains(get_m,',')|| contains(get_m,'+'))
    error ('Invalid input. Only numbers for month.');
end  

% Month is from 1-12
if (month <1 || month > 12)
    error ('Invalid month input. Month should be 1-12\n');  
end

% Year
get_y = input('Enter year: ', 's');
year = str2double(get_y); %converting string to number

if (isnan(year))
    error ('Invalid input. Only numbers for year.');
elseif (contains(get_y,'.')||contains(get_y,',')|| contains(get_y,'+'))
    error ('Invalid input. Only numbers for year.');
end  

% Year is a positive number
if (year < 1)
    error ('Invalid year input. Year must be a positive number.\n');  
end

%Duration
time = input('Enter number of days it takes to complete the assignment: ');

% Duration is a positive number
if (time < 0)
    error('Invalid duration input. It must be positive number.');
end    


% Converting duration(days) to year, month, day
if (time < 30)
    d = time;
    m = 0;
    y = 0;
elseif (time >= 30 && time < 360)
    d = mod(time,30);
    m = floor(time/30);
    y = 0;
elseif (time >= 360)
    y = floor(time/360);
    remainder = mod(time, 360);
    m = floor(remainder/30);
    d = mod(remainder,30);
end    
  

%Getting submission dates by adding the duration to the assignment date
sub_day = day + d;
sub_month = month + m;
sub_year = year + y;

%Checking new dates if it is valid, Correct it if not

% Correct day
if(sub_day > 30)
    sub_day = sub_day - 30;
    sub_month = sub_month + 1;
end    

%Correct month
if (sub_month > 12)
    sub_month = sub_month - 12;
    sub_year = sub_year + 1;
    
end   
    
fprintf ('Your homework was submitted on %02d/%02d/%04d.\n\n', sub_month, sub_day,sub_year); 

%% Part 2

% Description: this script returns the score a student gets and how many
% the homework is late
% Input:  Due date of the homework
% Output: The number of days late and score
% Method: Using if-else and arithmetic operations

fprintf("Input the due date for the homework.\n");
% Getting all the inputs and checking validity similarl to part 1

% Due day
get_d = input('Enter day:', 's');

due_d = str2double(get_d); %converting string to number
if (isnan(due_d))
    error ('Invalid input. Only numbers for day.');
elseif (contains(get_d,'.')||contains(get_d,',')|| contains(get_d,'+'))
    error ('Invalid input. Only numbers for day.');
end  

if (due_d <0 || due_d > 30)
    error ('Invalid day input. Day shoulbe be 1-30\n');  
end

% Due month
get_m = input('Enter month:', 's');

due_m = str2double(get_m); %converting string to number
if (isnan(due_m))
    error ('Invalid input. Only numbers for month.');
elseif (contains(get_m,'.')||contains(get_m,',')|| contains(get_m,'+'))
    error ('Invalid input. Only numbers for month.');
end  

if (due_m <1 || due_m > 12)
    error ('Invalid month input. Month should be 1-12\n');  
end

% Due year
get_y = input('Enter year:','s');
due_y = str2double(get_y); %converting string to number

if (isnan(due_y))
    error ('Invalid input. Only numbers for year.');
elseif (contains(get_y,'.')||contains(get_y,',')|| contains(get_y,'+'))
    error ('Invalid input. Only numbers for year.');
end  

if (year < 1)
    error ('Invalid year input. Year must be a positive number.\n');  
end

% Converting dates to total number of days before doing the comparison
% The one with less total of days is earlier and vice versa

total_ass = day + month*30 + year*360;
total_due = due_d + due_m*30 + due_y*360;
total_sub = sub_day + sub_month*30 + sub_year*360;

% Due date cannot be earlier than assignment date
if (total_due <= total_ass)
    error('Invalid due date input. Due date cannot be earlier than the assignment date.\n');
end

% When the submission date is later than the due date
if(total_sub > total_due)
    % Calculate how many days late
    late = total_sub - total_due;
    
    
    if(late >= 5)
        % If students submit hw after 5 days will get 0
        fprintf('You were %d days late. Your score is 0.\n',late);
    else
        % If students submit hw late but less than 5 days
        score = 100 - (late*10); % reduced 10% for each day late
        fprintf('You were %d days late. Your score is %d.\n', late, score);
    end
else
    % If students submit hw early or on time
    fprintf('Great work! Your score is 100!\n');
end    
        
        

        






    
    


    
    


