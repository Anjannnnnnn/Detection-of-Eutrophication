%% Reading images
img1=imread("test1.jpg");
img2=imread("test2.jpg");
%% Displaying images
figure
imshow(img1);
figure
imshow(img2);
%% Converting to monochrome
img1bw=rgb2gray(img1);
img2bw=rgb2gray(img2);
%% Subtract images
imgdiff = abs(img1-img2);
imgdiffbw = rgb2gray(imgdiff);
figure
imshow(imgdiffbw);
imgthresh0 = imadjust(imgdiffbw);
figure
imshow(imgthresh0)
%% Setting threshold image
imgthresh = imgdiffbw>1;
figure 
imshow(imgthresh);
%% Filtering image by median pixel value
imgFilter1 = medfilt2(imgthresh);
imgFilter2 = medfilt2(imgFilter1);
imgFilter3 = medfilt2(imgFilter2);
figure
imshow(imgFilter3);
%% Finding Area
imgArea = bwarea(imgFilter3);
disp('Area =')
disp(imgArea)
%% Check if obtained area is significant
if imgArea>1000
 disp('Eutrophication affected')
else
 disp('Eutrophication unaffected')
end
%% Obtain percentage of eutrophication
Tarea = numel(img1bw);
Tcomp = 0.2*Tarea;
if imgArea>1000
percentage = (imgArea/Tcomp)*100;
disp('The approximate percentage of water body affected is')
disp(percentage)
if percentage>70
 disp('High level of eutrophication')
elseif percentage>50
 disp('Mid level of eutrophication')
else
 disp('Low level of eutrophication')
end
