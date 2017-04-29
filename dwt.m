%WAVELET

clear all;
clc;

data=imread('sidikjari5.jpg');
r=data(:,:,1);
g=data(:,:,2);
b=data(:,:,3);

gray=double(0.333*r+0.333*g+0.333*b)/512;

[m, n] = size(gray);

%=================== WAVELET LV 1 ===================%

mm=m/2;
nn=n/2;
for i=1:mm
    for j=1:nn
        cb1=(gray(i*2-1,j*2));
        %cb1=double(cb1);
        cb2=(gray(i*2,j*2-1));
        %cb2=double(cb2);
        ca(i,j)=sqrt(cb1^2+cb2^2);
    end
end
[m1,n1]=size(ca);

for i=1:mm
    for j=1:nn
        cb1=(gray(i*2-1,j*2-1));
        cb2=(gray(i*2,j*2-1));
        cv(i,j)=(cb1+cb2)/2;
    end
end
[m2,n2]=size(cv);

for i=1:mm
    for j=1:nn
        cb1=(gray(i*2-1,j*2-1));
        cb2=(gray(i*2-1,j*2));
        ch(i,j)=(cb1+cb2)/2;
    end
end
[m3,n3]=size(ch);

for i=1:mm
    for j=1:nn
        cb1=(gray(i*2-1,j*2-1));
        cb2=(gray(i*2,j*2));
        cd(i,j)=(cb1+cb2)/2;
    end
end
[m4,n4]=size(cd);

l1=figure;
imshow(l1);
subplot(2,2,1);
imshow(ca);
title('ca');
subplot(2,2,2);
imshow(ch);
title('ch');
subplot(2,2,3);
imshow(cv);
title('cv');
subplot(2,2,4);
imshow(cd);
title('cd');

%=================== WAVELET LV 2 ===================%

mmm=m1/2;
nnn=n1/2;
for i=1:mmm
    for j=1:nnn
        cb1=(ca(i*2-1,j*2));
        cb2=(ca(i*2,j*2-1));
        ca2(i,j)=sqrt(cb1^2+cb2^2);
    end
end
[mm1,nn1]=size(ca2);

for i=1:mmm
    for j=1:nnn
        cb1=(ca(i*2-1,j*2-1));
        cb2=(ca(i*2,j*2-1));
        cv2(i,j)=(cb1+cb2)/2;
    end
end
[mm2,nn2]=size(cv2);

for i=1:mmm
    for j=1:nnn
        cb1=(ca(i*2-1,j*2-1));
        cb2=(ca(i*2-1,j*2));
        ch2(i,j)=(cb1+cb2)/2;
    end
end
[mm3,nn3]=size(ch2);

for i=1:mmm
    for j=1:nnn
        cb1=(ca(i*2-1,j*2-1));
        cb2=(ca(i*2,j*2));
        cd2(i,j)=(cb1+cb2)/2;
    end
end
[mm4,nn4]=size(cd2);

l2=figure;
imshow(l2);
subplot(2,2,1);
imshow(ca2);
title('ca2');
subplot(2,2,2);
imshow(ch2);
title('ch2');
subplot(2,2,3);
imshow(cv2);
title('cv2');
subplot(2,2,4);
imshow(cd2);
title('cd2');

%=================== WAVELET LV 3 ===================%

mmmm=mm1/2;
nnnn=nn1/2;
for i=1:mmmm
    for j=1:nnnn
        cb1=(ca2(i*2-1,j*2));
        cb2=(ca2(i*2,j*2-1));
        ca3(i,j)=sqrt(cb1^2+cb2^2);
    end
end
[mmm1,nnn1]=size(ca3);

for i=1:mmmm
    for j=1:nnnn
        cb1=(ca2(i*2-1,j*2-1));
        cb2=(ca2(i*2,j*2-1));
        cv3(i,j)=(cb1+cb2)/2;
    end
end
[mmm2,nnn2]=size(cv3);

for i=1:mmmm
    for j=1:nnnn
        cb1=(ca2(i*2-1,j*2-1));
        cb2=(ca2(i*2-1,j*2));
        ch3(i,j)=(cb1+cb2)/2;
    end
end
[mmm3,nnn3]=size(ch3);

for i=1:mmmm
    for j=1:nnnn
        cb1=(ca2(i*2-1,j*2-1));
        cb2=(ca2(i*2,j*2));
        cd3(i,j)=(cb1+cb2)/2;
    end
end
[mmm4,nnn4]=size(cd3);

level1=[ca cv;
        ch cd;];
level2ca=[ca2 cv2;
          ch2 cd2];
level3ca=[ca3 cv3;
          ch3 cd3];

l3=figure;
imshow(l3);
subplot(2,2,1);
imshow(ca3);
title('ca3');
subplot(2,2,2);
imshow(ch3);
title('ch3');
subplot(2,2,3);
imshow(cv3);
title('cv3');
subplot(2,2,4);
imshow(cd3);
title('cd3');     
 
%=================== EKSTRAKSI CIRI WAVELET LV 3 ===================%

rerataca3 = mean2(ca3); %fitur
reratach3 = mean2(ch3); %fitur
reratacv3 = mean2(cv3); %fitur
reratacd3 = mean2(cd3); %fitur

sdevca3 = std2(ca3); %fitur
sdevch3 = std2(ch3); %fitur
sdevcv3 = std2(cv3); %fitur
sdevcd3 = std2(cd3); %fitur

varca3 = sdevca3^2; %fitur
varch3 = sdevch3^2; %fitur
varcv3 = sdevcv3^2; %fitur
varcd3 = sdevcd3^2; %fitur

x=[rerataca3  reratach3 sdevca3 sdevch3  varca3  varch3]



save test.txt x -ascii -append; %ekstraksi ciri wavelet