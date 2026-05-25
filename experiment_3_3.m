% 实验三 任务三：不同占空比周期矩形脉冲频谱对比
clear; clc; close all;

tau = 1; % 固定脉宽

% 1. 占空比 1/4 (T = 4)
T1 = 4;
Omega1 = 2 * pi / T1;
n1 = -15:15;
Fn1 = sin(n1 * pi * tau / T1) ./ (n1 * pi + eps);
Fn1(n1 == 0) = tau / T1;

% 2. 占空比 1/8 (T = 8)
T2 = 8;
Omega2 = 2 * pi / T2;
n2 = -30:30; % 扩大谱线范围展示相同频段
Fn2 = sin(n2 * pi * tau / T2) ./ (n2 * pi + eps);
Fn2(n2 == 0) = tau / T2;

% 绘图对比
figure('Name', '不同占空比周期矩形脉冲频谱对比');

% 占空比 1/4 幅度与相位
subplot(2, 2, 1);
stem(n1 * Omega1, abs(Fn1), 'filled', 'g', 'LineWidth', 1);
title('占空比 1/4: 幅度谱');
xlabel('\omega'); ylabel('|F_n|');
grid on;

subplot(2, 2, 3);
stem(n1 * Omega1, angle(Fn1), 'filled', 'g', 'LineWidth', 1);
title('占空比 1/4: 相位谱');
xlabel('\omega'); ylabel('\phi_n (rad)');
grid on;

% 占空比 1/8 幅度与相位
subplot(2, 2, 2);
stem(n2 * Omega2, abs(Fn2), 'filled', 'r', 'LineWidth', 1);
title('占空比 1/8: 幅度谱');
xlabel('\omega'); ylabel('|F_n|');
grid on;

subplot(2, 2, 4);
stem(n2 * Omega2, angle(Fn2), 'filled', 'r', 'LineWidth', 1);
title('占空比 1/8: 相位谱');
xlabel('\omega'); ylabel('\phi_n (rad)');
grid on;