#Revision week 8 - Intro to Machine Learning

image processing, analysis and understanding lie on a continuum depending on operation from low to high level.

image understanding can be classification, detection or segmentation.

neural networks first excel at image classification.

step 1: compare image to all known images by doing pixel by pixel differences and the result as abolute. This is called nearest neighbour classifier.

Unkown image is called the test image.

### k-NN

k-NN(K nearest neighbour) labels an image based on variying k value that is the hyperparameter. Instead of identifying one image that can be the unknown image it compares a small subset of known images against the unknown image.  K varies depending on number of neighbours to consider. Lrger K generally looks for more neighbour pixels.

Performance peaks in cifar-10 dataset when 5>=k>7

NN and k-NN gives approx accuracy of 30-40%, human is above 95% and best neural network is 99.37%

### IMAGE UNDERSTANDING IS HARD DUE TO VARIABILITY

- Variability in illumination

- variaibility in pose/point of view/oreintation

- Occlusion = Parts of objects we are interested in are occluded due to other objects or themselves.

- Variability within a class/category is as great as variability between categories. eg: Many different breeds of dogs and cats.

### Neural Network Basics


Interconnectivity and layering of neurons in the brain.

Sum of weighted inputs exceed a threshold then the output is HIGH and the unit "fires".

McCulloch Pitts model has an additional input of a bias this allows for logical AND, OR and NOT but not XOR.

Minsky and Papert model allows for XOR using layered connection of neurons.

## WHAT IS MACHINE LEARNING

Machine learning is the process of determing the weights in a neuron model.
