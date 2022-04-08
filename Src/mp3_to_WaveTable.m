clear all; close all;

[mp3_data_raw,Fs] = audioread('Star_Trek_Red_Alert.mp3');
sound_data_2sec=mp3_data_raw(1:44100*1.9,1);

new_Fs=15e3;
epsilon = (new_Fs - Fs)/Fs;
% sound_data_10kHz = resample(sound_data_2sec, epsilon);
sound_data_15kHz = resample(sound_data_2sec,new_Fs,Fs);
sound(sound_data_15kHz,new_Fs/1.1);

mp3_data_raw_norm = (sound_data_15kHz - min(sound_data_15kHz))/(max(sound_data_15kHz) - min(sound_data_15kHz));

fprintf("min: %d, max: %d\n", min(mp3_data_raw_norm), max(mp3_data_raw_norm));

sound_bit_depth = 8;

DAC_data_15000 = round(mp3_data_raw_norm * 2^(sound_bit_depth));

% sound(DAC_data_15000,new_Fs,sound_bit_depth);



fileID = fopen('sound_data.c', 'wt');  %open file
%write FIR filter coefficients
fprintf(fileID,strcat('const static uint16_t Fs=',num2str(new_Fs),';\n'));
fprintf(fileID,strcat('const static uint8_t sound_data[',num2str(length(DAC_data_15000)),'] = {\n\t'))

N=20;
for i=1:length(DAC_data_15000)
%     if(mod(i,30)==0)
%         fprintf(fileID,'\n\t');
%     end
   fprintf(fileID,strcat(num2str(DAC_data_15000(i)),', ')); 
end
fprintf(fileID,'\n};');



% formatSpec = '%1.16e, \n';
% fprintf(fileID,formatSpec,b(1:end-1))
% formatSpec = '%1.16e};\n\n';
% fprintf(fileID,formatSpec,b(end))
% %write IIR 'a' filter coefficients
% %This file does not write the first 'a' coefficient
% fprintf(fileID,'const static double iirACoefficientConstants[FILTER_FREQUENCY_COUNT][IIR_A_COEFFICIENT_COUNT] = {\n')



