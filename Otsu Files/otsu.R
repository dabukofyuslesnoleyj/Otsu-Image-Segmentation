#To import EBImage
library(EBImage)


otsuMethod = function(image) {
	#insert code here
}

#Segment Image using Otsu's method

#Read Image file
image = readImage("<Insert path of the image file here>")
#Convert the image from RGB to Grayscale
grayImage = channel(image,"gray")

#Scale the pixel values to 0 - 255
grayImageScaled = floor(grayImage * 255)

#Get the optimal threshold
optimalThresh = otsuMethod(grayImageScaled)


#Separate the image into two parts based on the threshold
mask1 = grayImageScaled
mask2 = grayImageScaled

mask1[mask1 < optimalThresh] = 1
mask1[mask1 >= optimalThresh] = 0


mask2[mask2 < optimalThresh] = 0
mask2[mask2 >= optimalThresh] = 1

image1 = image
image2 = image

image1[,,1] = image1[,,1] * mask1
image1[,,2] = image1[,,2] * mask1
image1[,,3] = image1[,,3] * mask1

image2[,,1] = image2[,,1] * mask2
image2[,,2] = image2[,,2] * mask2
image2[,,3] = image2[,,3] * mask2

display(image1)
display(image2)


