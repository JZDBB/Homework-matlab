n = 10000;
vr = 1.0;
r = sqrt(vr) * randn(size(1:n));
ds = .15;
mu = .001;
lenavg = 10;
a = zeros(size(1:n));
a(1) = 1;
s = zeros(size(1:n));
avec = zeros(1, lenavg);
for k = 1:n-1
    s(k) = a(k) * r(k);
    avec = [sign(a(k)) * (s(k)^2 - ds), avec(1:end - 1)];
    a(k+1) = a(k) - mu * mean(avec);
end

