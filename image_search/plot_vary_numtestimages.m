function plot_vary_numtestimages(plot_type)

if strcmpi(plot_type, 'groundtruth')
    load('../../data/predict_search/pascal/groundtruth_logistic.mat');
elseif strcmpi(plot_type, 'predicted')
    load('../../data/predict_search/pascal/predicted_logistic.mat');
elseif strcmpi(plot_type, 'predicted_1000fold')
    load('../../data/predict_search/pascal/predicted_logistic_1000fold.mat');
else
    load('../../data/predict_search/pascal/predicted_logistic_1000fold_python.mat');
end

rank_s = zeros(1,length(test_size)); rank_b = zeros(1, length(test_size));
for idx=1:length(test_size)
    rank_s(idx) = mean(rank_specificity{idx});
    rank_b(idx) = mean(rank_baseline{idx});
end

subplot(1,2,1);
plot(test_size, rank_s, 'ro-', 'MarkerFacecolor', 'w'); hold on;
plot(test_size, rank_b, 'bo-', 'MarkerFacecolor', 'w');
ylabel('Mean rank', 'Fontsize', 12);
legend('Predicted specificity', 'Baseline');
xlabel('Number of images ranked', 'Fontsize', 12);
title('Predicted vs baseline (Pascal)', 'Fontsize', 14);

subplot(1,2,2);
plot(test_size, rank_b - rank_s, 'bo-', 'MarkerFacecolor', 'w');
ylabel('Baseline rank - predicted specificity rank', 'Fontsize', 12);
xlabel('Number of images ranked', 'Fontsize', 12);

end
