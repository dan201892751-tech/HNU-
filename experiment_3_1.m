% 实验三 任务一：周期三角信号的FS合成与频谱
clear; clc; close all;

% 1. 定义时间与周期参数
T = 2;
Omega0 = 2 * pi / T; % 基频为 \pi
t = -3:0.01:3;      % 观察3个周期

% 2. 构造原始周期三角波信号
% 单周期内 f(t) = 1 - |t|
f_orig = 1 - abs(mod(t + 1, 2) - 1); 

% 3. 谐波合成 (N = 3, 9, 21, 45)
N_vals = [3, 9, 21, 45];
figure('Name', '周期三角信号傅里叶级数合成');
for idx = 1:length(N_vals)
    N = N_vals(idx);
    f_synth = 0.5 * ones(size(t)); % 初始化为直流分量 a0/2 = 0.5
    for n = 1:N
        an = 2 * (1 - (-1)^n) / (n * pi)^2;
        f_synth = f_synth + an * cos(n * Omega0 * t);
    end
    
    subplot(2, 2, idx);
    plot(t, f_orig, 'r', 'LineWidth', 1.5); hold on;
    plot(t, f_synth, 'g', 'LineWidth', 1);
    title(['谐波项数 N = ', num2str(N)]);
    xlabel('t'); ylabel('f(t)');
    legend('原始信号', '合成信号');
    grid on;
end

% 4. 绘制单边幅度谱与相位谱
N_spec = 20; % 绘制前20项谱线
n_axis = 0:N_spec;
An = zeros(size(n_axis));
phi = zeros(size(n_axis));

An(1) = 0.5; % 直流分量
for n = 1:N_spec
    An(n+1) = 2 * (1 - (-1)^n) / (n * pi)^2;
    phi(n+1) = 0; % 由于an >= 0，相位角均为0
end

figure('Name', '周期三角信号的单边谱');
subplot(2, 1, 1);
stem(n_axis * Omega0 / pi, An, 'filled', 'LineWidth', 1.5);
title('单边幅度谱');
xlabel('\omega (\times \pi)'); ylabel('A_n');
grid on;

subplot(2, 1, 2);
stem(n_axis * Omega0 / pi, phi, 'filled', 'LineWidth', 1.5);
title('单边相位谱');
xlabel('\omega (\times \pi)'); ylabel('\phi_n (rad)');
ylim([-1, 1]);
grid on;