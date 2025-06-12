
clc 
clear all; 
close all; 
eeg=xlsread('signal1.xlsx'); 
eegF7 = eeg(:,3); 
figure(1); 
plot(eegF7); 
fs=128; 
T=1/fs; 
xlabel('Time (sec)'); 
ylabel('Amplitude (µV)'); 
title('raw eeg signal'); 
%time 
t =(0:length(eegF7)-1)*T; 
%frequency 
freq = 0:(fs/length(eegF7)):fs/2; 
figure(2); 
plot(t,eegF7); 
xlabel('time (sec)'); 
ylabel('amplitude (µV)'); 
title('sampled EEG F7 RAW signal'); 
%filter vs raw eeg 
passband=0.5; 
stopband=44; 
[b,a]=butter(2,[passband stopband]/(fs/2)); 
filtera=filtfilt(b,a,eegF7); 
figure(4); 
plot(t,filtera); 
xlabel('Time (sec)'); 
ylabel('Amplitude (µV)'); 
title('filtered raw eeg signal'); 
%smooth signal 
eegsF7=smooth(eegnF7,8); 
figure(6); 
plot(t,eegsF7); 
title('smoothened signal'); 
%separation of eeg waves 
%delta 
passband=0.5; 
stopband=3.5; 
[bz,az]=butter(2,[passband stopband]/(fs/2)); 
delta=filtfilt(bz,az,eegsF7); 
figure(7); 
subplot(3,3,1); 
plot(t,delta); 
xlabel('time in sec'); 
ylabel('amplitude'); 
title('delta wave'); 
%theta wave 
passband=3.5; 
stopband=8; 
[bq,aq]=butter(2,[passband stopband]/(fs/2)); 
theta=filtfilt(bq,aq,eegsF7); 
subplot(3,3,2); 
plot(t,theta); 
xlabel('time in sec'); 
ylabel('amplitude'); 
title('theta wave'); 
%alpha  
passband=8; 
stopband=13; 
[bx,ax]=butter(2,[passband stopband]/(fs/2)); 
alpha=filtfilt(bx,ax,eegsF7); 
subplot(3,3,3); 
plot(t,alpha); 
xlabel('time in sec'); 
ylabel('amplitude'); 
title('alphA wave'); 
%beta 
passband=13; 
stopband=30; 
[by,ay]=butter(2,[passband stopband]/(fs/2)); 
beta=filtfilt(by,ay,eegsF7); 
subplot(3,3,4); 
plot(t,beta); 
xlabel('time in sec'); 
ylabel('amplitude'); 
title('beta wave'); 
%gamma wave 
passband=30; 
stopband=44; 
[br,ar]=butter(2,[passband stopband]/(fs/2)); 
gamma=filtfilt(br,ar,eegsF7);
subplot(3,3,5);
plot(t,gamma);
xlabel('time in sec');
ylabel('amplitude');
title('gamma wave');
%POWER SPECTRUM 
%delta 
passdft=fft(delta); 
subplot(3,3,1); 
plot(freq,abs(passdft(1:length(freq))),'black'); 
set(gca,'fontsize',14,'fontname','Times New Roman'); 
title('\fontsize{14}\fontname{Times New Roman}Spectrum of DELTA'); 
xlabel('\fontsize{14}\fontname{Times New Roman}Frequency in hz'); 
ylabel('\fontsize{14}\fontname{Times New Roman}Amplitude'); 
%theta 
passdft=fft(theta); 
subplot(3,3,2); 
plot(freq,abs(passdft(1:length(freq))),'black'); 
set(gca,'fontsize',14,'fontname','Times New Roman'); 
title('\fontsize{14}\fontname{Times New Roman}Spectrum of THETA'); 
xlabel('\fontsize{14}\fontname{Times New Roman}Frequency in hz'); 
ylabel('\fontsize{14}\fontname{Times New Roman}Amplitude'); 
%ALPHA 
passdft=fft(alpha); 
subplot(3,3,3); 
plot(freq,abs(passdft(1:length(freq))),'black'); 
set(gca,'fontsize',14,'fontname','Times New Roman'); 
title('\fontsize{14}\fontname{Times New Roman}Spectrum of ALPHA'); 
xlabel('\fontsize{14}\fontname{Times New Roman}Frequency in hz'); 
ylabel('\fontsize{14}\fontname{Times New Roman}Amplitude'); 
%BETA 
passdft=fft(beta); 
subplot(3,3,4); 
plot(freq,abs(passdft(1:length(freq))),'black'); 
set(gca,'fontsize',14,'fontname','Times New Roman'); 
title('\fontsize{14}\fontname{Times New Roman}Spectrum of BETA'); 
xlabel('\fontsize{14}\fontname{Times New Roman}Frequency in hz'); 
ylabel('\fontsize{14}\fontname{Times New Roman}Amplitude'); 
%GAMMA 
passdft=fft(gamma); 
subplot(3,3,5); 
plot(freq,abs(passdft(1:length(freq))),'black'); 
set(gca,'fontsize',14,'fontname','Times New Roman'); 
title('\fontsize{14}\fontname{Times New Roman}Spectrum of GAMMA'); 
xlabel('\fontsize{14}\fontname{Times New Roman}Frequency in hz'); 
ylabel('\fontsize{14}\fontname{Times New Roman}Amplitude'); 
    