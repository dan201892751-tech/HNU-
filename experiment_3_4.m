% 实验三 任务四：验证傅里叶变换的时移性质
clear; clc; close all;

w = -15:0.05:15;

% 原始信号 f(t) (中心在t=0的矩形脉冲，其FT为Sinc函数)
F = sin(w/2 + eps) ./ (w/2 + eps);

% 时移信号 g(t) = f(t - 1) (平移量 t0 = 1)
% 其FT为原FT乘以 exp(-j*w*t0)
t0 = 1;
G = F .* exp(-j * w * t0);

% 绘制并验证
figure('Name', '时移性质验证');

% 幅度谱对比 (应当完全重合)
subplot(2, 1, 1);
plot(w, abs(F), 'w', 'LineWidth', 2); hold on;
plot(w, abs(G), 'r--', 'LineWidth', 1.5);
title('时移前后幅度频谱对比');
xlabel('\omega'); ylabel('幅度');
legend('原始信号 f(t)', '时移信号 f(t-1)');
grid on;

% 相位谱对比 (时移后应表现出线性相位随频率变化的特征)
subplot(2, 1, 2);
plot(w, angle(F), 'g', 'LineWidth', 1.5); hold on;
plot(w, angle(G), 'r', 'LineWidth', 1.5);
title('时移前后相位频谱对比');
xlabel('\omega'); ylabel('相位 (rad)');
legend('原始信号 f(t)', '时移信号 f(t-1)');
grid on;