x=0:0.1:10;
for i=1:10
	y=x.^i;
	plot(x,y,'r+')
	sleep(1);
end