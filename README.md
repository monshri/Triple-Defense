# Triple Noise to mitigate adversarial effects in following three areas:
1.	Training noise: add random noise to the original images in the training dataset.
2.	Model noise: train diverse M models, and, at inference phase, select random N of M models’ output (where N < M) to represent the inference output of the ensemble model. 
3.	Inference noise: add random noise to the image at inference time before feeding it to the ML model. 

# Implementation of the Triple Noise:
#### A. Training noise: 
1.	Data preparation (CIFAR10 dataset)
a.	Download the python version of data from: https://www.cs.toronto.edu/~kriz/cifar-10-python.tar.gz   
2.	Data normalization 
a.	Divide image data by 255 then center to 0, i.e. (image / 255) - 0.5
3.	Add Gaussian noise to images (numpy arrays) in the training data with Numpy random number generator:
a.	Specify a seed number and instantiate a generator with the seed.
b.	Generate random noise from Normal distribution with mean 0 and standard deviation sigma. 
c.	Add the noise to the original image.
d.	Clip the noise-modified image to keep its pixel values within the proper image data range.

#### B. Model noise:
Use ShuffleNet model in Pytorch for the experiments:
1.	Train a model with the training data from A.3. 
2.	Save the model weight files to disk
3.	Repeat A.3 and B.1 and B.2 to train M number of different models. In order for them to be different, select each time a different seed number in A.3.

#### C. Add noise in inference time, ensemble on N of M diverse models (where N < M):
1.	Pre-load M models trained from B into an array or dictionary. 
2.	In inference time, Gaussian noise (generated with tf.random.normal) with mean 0 and standard deviation specified in the parameter (For our experiments, we found a value around 0.1 for the standard deviation parameter produced good results both for PGD attack with perturbation parameter epsilon=0.03 and for CW attack) is added to the input image in the network with appropriate clipping as in A.3.d. (Randomization at inference time makes the network more robust to both single step and multiple steps attacks.)
3.	For each of the M trained models, input the noise-modified image to the model and get the network output, i.e., the vector of confidence values of the image’s classes.
4.	Select random N of the M models’ outputs from step 3 to create an ensemble of the inference outputs. For multiple steps iterative attacks, multiple gradient computation and inferences are performed.   A random subset of N models is selected for an inference of each iteration step. This will make the network more robust to multiple step attacks. 
5.	Take the average of the N output vectors of the class confidences as the output of the inference of the ensemble model.


#### D. Some Implementation Details
We want the subset of N of M model outputs to be randomly selected on each inference. The random selection of N models needs to happen in the network’s computation graph. The subset of N models randomly selected outside of the graph (such as using np.random.choice) will not be re-invoked on the network graph inference. Therefore, this will cause the subset of N models will not change during the multiple steps attack’s iterative network inferences or updated data fed into the graph.  We need to be careful on the implementation for this.

