function [r]= pca_1(a)
%takes a matrix as a input
%   Detailed explanation goes here
    % a=[1 2 3; 4 5 6; 7 8 9];
    a = [302,5818	-98,2666
449,9817	-109,1003
345,9167	-131,3782
386,3525	-132,1411
330,9631	-96,7407
366,0583	-113,3728
305,9387	-101,9287
363,7695	-98,2666
265,3503	-127,5635
355,072	-114,2883
397,7966	-147,2473
421,1426	-137,7869
351,8677	-95,8252
361,6333	-110,4736
361,9385	-191,4978
301,2085	-70,343
312,1948	-75,9888
302,887	-60,73
244,5984	-56,3049
393,9209	-164,4287
394,3482	-148,9868
407,6538	-135,0708
315,4907	-124,4507
149,0479	-57,0068
359,253	-201,0498
378,7232	-96,4356
385,315	-127,2583
375,9766	-104,9805
381,0425	-125,2442
406,4331	-224,8535
414,856	-115,4785
391,2354	-140,3198
356,7505	-124,2676
314,8194	-121,0938
378,5401	-122,6196
366,8824	-147,583
356,8726	-156,9824
273,8953	-117,1875
354,3091	-94,4519
343,4753	-120,697
164,4897	-113,8306
327,1484	-144,6533
370,0256	-92,1631
201,416	-39,8254
282,4402	-66,8335
353,8513	-97,0459
337,0667	-123,7488
324,8596	-143,4326
273,2849	-153,3508
386,5051	-133,3618
419,6167	-106,3538
374,4507	-110,0159
289,6118	-100,2502
337,2192	-106,0486
362,2437	-129,6997
364,6851	-147,7051
370,7886	-110,1685
309,906	-96,1304
255,2795	-150,9094
339,0503	-168,9148
368,3472	-127,4109
308,3496	-55,0537
340,149	-73,0591
243,7524	-60,6079
323,0591	-88,4399
338,9282	-101,5625
];
    display(' data matrix');
    disp(a);
    disp('dimension of the matrix');
    [m n]= size(a); %calculate the dimension of data matrix
    
    a_mean = mean(a);
    display('The mean matrix');
    disp(a_mean); %display the mean matrix
    disp('Standard Diavation of matrix');
    a_std= std(a);
    % the first step in PCA is to standardize the data.
    %Here, "standardization" means subtracting the sample mean from each observation,
    %then dividing by the sample standard deviation.
    %This centers and scales the data.
    disp(a_std);
    disp('Standarised matrix');
    b = (a - repmat(a_mean,[m 1])) ./ repmat(a_std,[m 1]);
    % B = zscore(A) is alternate way to calculate standarised matrix
    disp(b); %display the Standarised matrix

    %Calculating the coefficients of the principal components and 
    %their respective variances is done by finding the eigenfunctions of the sample covariance matrix:
    disp('%Calculating the coefficients of the principal components');
    [V D] = eig(cov(b));
    %display coefficent matrix contains principal components
    disp('coefficent matrix contains principal components');
    disp(V);
    coefforth=V;
    %display variance of the respective principal component
    disp(' variance of the respective principal component');
    disp(D);
    disp('the diagonal variance matrix');
    s =diag(D);
    disp(s);
    disp('the resultant principal component is ');
    %here, first pc is appear at the last column because of using eig function
    r= b*V;
   % disp(r);
   
   
   figure();
biplot(coefforth(:,1:3),'scores',b(:,1:3));
axis([-1 1 -1 1 -1 1]);
view([30 40]);
end