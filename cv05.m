close all
clear
clc

% Úkol 1: k-means
arr_1 = rand(1000, 1);
arr_2 = rand(1000, 1);

[idx_2, C_2] = kmeans([arr_1, arr_2], 2);

figure('Name','K-means clustering')
subplot(2, 2, 1)
plot(arr_1(idx_2==1), arr_2(idx_2==1), 'r.', 'MarkerSize', 8)
hold on
plot(arr_1(idx_2==2), arr_2(idx_2==2), 'b.', 'MarkerSize', 8)
plot(C_2(:,1), C_2(:,2), 'kx', 'LineWidth', 2.5, 'MarkerSize', 12)
hold off

legend('Cluster 1', 'Cluster 2', 'Centers')
xlabel('Array 1')
ylabel('Array 2')
title('k-means - 2 clusters')

subplot(2, 2, 2)
[idx_5, C_5] = kmeans([arr_1, arr_2], 5);

subplot(2, 2, 2)
plot(arr_1(idx_5==1), arr_2(idx_5==1), 'r.', 'MarkerSize', 8)
hold on
plot(arr_1(idx_5==2), arr_2(idx_5==2), 'g.', 'MarkerSize', 8)
plot(arr_1(idx_5==3), arr_2(idx_5==3), 'b.', 'MarkerSize', 8)
plot(arr_1(idx_5==4), arr_2(idx_5==4), 'm.', 'MarkerSize', 8)
plot(arr_1(idx_5==5), arr_2(idx_5==5), 'c.', 'MarkerSize', 8)
plot(C_5(:,1), C_5(:,2), 'kx', 'LineWidth', 2.5, 'MarkerSize', 12)
hold off

legend('Cluster 1', 'Cluster 2', 'Cluster 3', 'Cluster 4', ...
    'Cluster 5', 'Centers')
xlabel('Array 1')
ylabel('Array 2')
title('k-means - 5 clusters')



% Úkol 2: fuzzy c-means
[centers, U] = fcm([arr_1, arr_2], 2);
maxU = max(U);
index1 = find(U(1,:) == maxU);
index2 = find(U(2,:) == maxU);

subplot(2, 2, 3)
plot(arr_1(index1), arr_2(index1), 'r.')
hold on
plot(arr_1(index2), arr_2(index2), 'b.')
plot(centers(1,1), centers(1,2), 'xk','MarkerSize', 12, 'LineWidth', 2.5)
plot(centers(2,1), centers(2,2), 'xk','MarkerSize', 12, 'LineWidth', 2.5)
hold off

legend('Cluster 1', 'Cluster 2', 'Centers')
xlabel('Array 1')
ylabel('Array 2')
title('fuzzy c-means - 2 clusters')

[centers_5, U_5] = fcm([arr_1, arr_2], 5);
maxU_5 = max(U_5);
index1_5 = find(U_5(1,:) == maxU_5);
index2_5 = find(U_5(2,:) == maxU_5);
index3_5 = find(U_5(3,:) == maxU_5);
index4_5 = find(U_5(4,:) == maxU_5);
index5_5 = find(U_5(5,:) == maxU_5);

subplot(2, 2, 4)
plot(arr_1(index1_5), arr_2(index1_5), 'r.', 'MarkerSize', 8)
hold on
plot(arr_1(index2_5), arr_2(index2_5), 'g.', 'MarkerSize', 8)
plot(arr_1(index3_5), arr_2(index3_5), 'b.', 'MarkerSize', 8)
plot(arr_1(index4_5), arr_2(index4_5), 'm.', 'MarkerSize', 8)
plot(arr_1(index5_5), arr_2(index5_5), 'c.', 'MarkerSize', 8)

plot(centers_5(1,1), centers_5(1,2), 'xk','MarkerSize', 12, 'LineWidth', 2.5)
plot(centers_5(2,1), centers_5(2,2), 'xk','MarkerSize', 12, 'LineWidth', 2.5)
hold off

legend('Cluster 1', 'Cluster 2', 'Cluster 3', 'Cluster 4', ...
    'Cluster 5', 'Centers')
xlabel('Array 1')
ylabel('Array 2')
title('fuzzy c-means - 5 clusters')