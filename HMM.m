Metrix = [[0.4 0.3 0.3]
          [0.6 0.3 0.1]
          [0.6 0.1 0.3]];
P = [1/3 1/3 1/3];
P_2 = P * (Metrix^2);
Metrix_n = Metrix^1000;
% syms n;
% Metrix_n = limit(Metrix^n, n, inf);
P_n = P * Metrix_n;