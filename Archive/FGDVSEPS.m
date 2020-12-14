clc; clear all;

% %% FGD - Accuracy vs Epsilon (Shriti) (For models with noise 0.1) *
% %FGD - Accuracy vs Epsilon (Kiachen) (For models with noise 0.06)
% avg1 = [0.7432,0.6882,0.6029,0.6018,0.4837]
% eps1 = [0.005,0.01,0.02,0.04,0.08]
% figure(1)
% plot(eps1,avg1,'-*r','Linewidth',1)
% title('Accuracy vs epsilon for Fast Gradient Descent (FGD) with Training Noise - 0.1')
% xlabel('eps')
% ylabel('Accuracy')
% saveas(gcf,'ACCEPSFGD0.1.png')
% %legend('Ensemble Model with training noise 0.1','Ensemble Model with training noise 0.06')


%% FGD - Accuracy vs Epsilon (Shriti) (For models with noise 0.1) **
%FGD - Accuracy vs Epsilon (Kiachen) (For models with noise 0.06)
avg1 = [0.7432,0.6882,0.6029,0.6018,0.4837]
eps1 = [0.005,0.01,0.02,0.04,0.08]
avg2=[0.7882, 0.7367, 0.6777, 0.586, 0.4685]
eps2=[0.005, 0.01, 0.02, 0.04, 0.08]
figure(1)
plot(eps1,avg1,'-*b','Linewidth',1)
hold on 
plot(eps2,avg2,'-*r','Linewidth',1)
title('Accuracy vs epsilon plot for FGM')
xlabel('eps')
ylabel('Accuracy')
legend('Ensemble Model with training noise $$\sigma$$ = 0.1','Ensemble Model with training noise $$\sigma$$ = 0.06','interpreter','latex')

%% PGD - Accuracy vs Epsilon (Kiachen) (For models with noise 0.1) - *
eps = [0.03137255, 0.01568627, 0.00784314, 0.00392157]
avg = [0.15556962025316456, 0.37392405063291134, 0.6043037974683544, 0.760886075949367]


plot(eps,avg,'-*','Linewidth',1)
title('Accuracy vs epsilon plot for PGD with Training Noise $$\sigma$$ = 0.1','interpreter','latex')
xlabel('eps')
ylabel('Accuracy')

%% FGD - Accuracy vs Models (Shivani) (For models with noise 0.1) *
%eps = 0.1
%number of models selected = [1, 2, 3, 4, 5]

avg = [0.7522, 0.7491, 0.7514, 0.7422, 0.7448]
num = [1, 2, 3, 4, 5]

plot(num,avg,'-*','Linewidth',1)
title('Accuracy vs Number of Models for FGM with Training Noise $$\sigma$$ = 0.1','interpreter','latex')
xlabel('No of Models in Ensemble')
ylabel('Accuracy')

%% FGD - Accuracy vs Inference Noise (Kriti) (For models with noise 0.1)
% % For epsilon 0.01
% noisestd1 = [ 0.02 , 0.04, 0.06, 0.08, 0.1 ]
% avg1 = [ 0.7213, 0.7247, 0.7259, 0.7182, 0.7185] 
% 
% plot(noisestd,avg,'-*r','Linewidth',1)
% hold on
% title('Accuracy vs Inference Noise for Fast Gradient Descent (FGD) with Training Noise - 0.1, eps=0.01')
% xlabel('Inference Noise')
% ylabel('Accuracy')
% saveas(gcf,'ACCEPSFGDInfNoiseVsAcc0.1.png')

% %% FGD - Accuracy vs Inference Noise (Kaichen) (For models with noise 0.06)
% % eps = 0.01, FGM attack, training noise 0.06 
% noisestd = [ 0.02 , 0.04, 0.06, 0.08, 0.1]
% avg = [0.7109, 0.7172, 0.7262, 0.7287, 0.7279]
% plot(noisestd,avg,'-*b','Linewidth',1)
% title('Accuracy vs Inference Noise for Fast Gradient Descent (FGD) with Training Noise - 0.1, eps=0.01')
% xlabel('Inference Noise')
% ylabel('Accuracy')
% saveas(gcf,'ACCEPSFGDInfNoiseVsAcc0.06.png')



% %% FGD - Accuracy vs Inference Noise (Kriti) (For models with noise 0.1)
% %For epsilon 0.02 , FSM attack
% noisestd = [0.02 , 0.04, 0.06, 0.08, 0.1]
% avg = [0.67, 0.6684, 0.6655, 0.6653, 0.6653] 
% 
% plot(noisestd,avg,'-*r','Linewidth',1)
% hold on
% title('Accuracy vs Inference Noise for Fast Gradient Descent (FGD) with Training Noise - 0.1, eps=0.01')
% xlabel('Inference Noise')
% ylabel('Accuracy')
% saveas(gcf,'ACCEPSFGDInfNoiseVsAcc0.1.png')



%% ****Final******FGD - Accuracy vs Inference Noise (Kriti) (For models with noise 0.1) **
% For epsilon 0.01
noisestd1 = [ 0.02 , 0.04, 0.06, 0.08, 0.1 ]
avg1 = [ 0.7213, 0.7247, 0.7259, 0.7182, 0.7185] 
%For epsilon 0.02 , FSM attack
noisestd2 = [0.02 , 0.04, 0.06, 0.08, 0.1]
avg2 = [0.67, 0.6684, 0.6655, 0.6653, 0.6653] 

plot(noisestd1,avg1,'-*b','Linewidth',1)
hold on

plot(noisestd2,avg2,'-*r','Linewidth',1)
title('Accuracy vs Inference Noise for FGM with Training Noise $$\sigma$$ = 0.1','interpreter','latex')
xlabel('Inference Noise')
ylabel('Accuracy')
legend('$$\epsilon$$ = 0.01','$$\epsilon$$ = 0.02','interpreter','latex')

%% ******Final*****FGD - Accuracy vs Inference Noise (Kriti) (For models with noise 0.1)
% For epsilon 0.01
noisestd1 = [ 0.02 , 0.04, 0.06, 0.08, 0.1 ]
avg1 = [ 0.7213, 0.7247, 0.7259, 0.7182, 0.7185] 
plot(noisestd1,avg1,'-*b','Linewidth',1)
title('Accuracy vs Inference Noise for FGM with $$\epsilon$$ = 0.01','interpreter','latex')
xlabel('Inference Noise')
ylabel('Accuracy')
legend('Trained Noise $$\sigma$$ = 0.1','interpreter','latex')


