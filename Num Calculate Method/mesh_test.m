%%Ê¹ÓÃmeshº¯Êý»æÍ¼
xa = -18:0.5:18;
ya = xa;
[x,y] = meshgrid(xa,ya);
z = sin(sqrt((x.^2+y.^2)))/sqrt(x.^2+y.^2+eps);
za = griddata(xa,ya,z,x,y,'v4');
meshc(xa,ya,za);

