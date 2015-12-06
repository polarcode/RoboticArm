%[freq, amp, angle] = load('Transfer1.txt')
data = load('Transfer1.txt');
freq = data(:,1);
amp = data(:,2);
angle = data(:,3);

%logfreq = log10(freq);
%ampDB = 20.*log10(amp);


figure(1)
clf()
subplot(2,1,1); 
  plot(freq,amp); 
  title('Amplitudengange');
  xlabel('w'); 
  ylabel('Amp'); 
subplot(2,1,2);
  plot(freq, angle); 
  title('Phasengang');
  xlabel('w');
  ylabel('phi [°]'); 

ampDB = 20.*log10(amp);
figure(2)
clf()
subplot(2,1,1); 
  semilogx(freq,ampDB); 
  title('Amplitudengange');
  xlabel('log w'); 
  ylabel('Amp [dB]'); 
subplot(2,1,2);
  semilogx(freq, angle); 
  title('Phasengang');
  xlabel('lof w');
  ylabel('phi [°]'); 


scalefactor = 1000; 
w = freq.*2.*pi()./scalefactor;
u=w.^2;
n=length(w);
F=ones(n,3);    % create F matrix
F(:,2)=u;
F(:,3)=u.^2;  

[a,yVar,residual,aVar] = LinearRegression(F, 1./(amp.^2));
a
a(2) = a(2)./scalefactor^2
a(3) = a(3)./scalefactor^4
parameters = a'
StandardDev = sqrt(aVar)'
y = F*a;
figure(3)
plot((freq.*2.*pi()).^2,1./(amp.^2),u,y)
AV=[sqrt(aVar(1)) sqrt(aVar(2))./scalefactor^2 sqrt(aVar(3))./scalefactor^4]

a0 = a(1);
a1 = a(2);
a2 = a(3);

w02 = sqrt(a0/a2)
k = w02
alpha= sqrt((a1/a0+2*w02)/4)
w0 = sqrt(w02)

