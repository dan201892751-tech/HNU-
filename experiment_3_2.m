% 实验三 任务二：单三角脉冲的FT及其频谱
clear; clc; close all;

% 定义频率轴
w = -20:0.05:20;

% 理论计算傅里叶变换值 (引入eps避免分母为0)
Fw = (sin(w/2 + eps) ./ (w/2 + eps)).^2;

% 计算幅度和相位
F_amp = abs(Fw);
F_phase = angle(Fw);

% 绘图
figure('Name', '单三角脉冲傅里叶变换');
subplot(2, 1, 1);
plot(w, F_amp, 'g', 'LineWidth', 1.5);
title('幅度频谱 |F(j\omega)|');
xlabel('\omega (rad/s)'); ylabel('幅度');
grid on;

subplot(2, 1, 2);
plot(w, F_phase, 'r', 'LineWidth', 1.5);
title('相位频谱 \phi(\omega)');
xlabel('\omega (rad/s)'); ylabel('相位 (rad)');
ylim([-1, 1]);
grid on;