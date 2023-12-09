fc=1e9;
df=1e6;
h=0.48;
fs=60*1e9;
  
    
     n=1:2^17;
     x(n)=0;
     for k=0:3
         fe=fc+df*k;
    x(n)=x(n)+1*exp(j*fe*2*pi*n/fs);
     end
   y_channel = conv(x, h);
   for n=1:2^17
   y(n)=y_channel(n)*exp(-1*j*fc*2*pi*n/fs);
   end
    for n=2^17:2^17+10000
   y(n)=0;
   end
   yreal=real(y);
   ymax=max(abs(yreal));
   yreal=yreal/ymax;
   yreal=yreal';
   yimag=imag(y);
   y1max=max(abs(yimag));
   yimag=yimag/y1max;
   yimag=yimag';
    csvwrite('aa1.csv',yreal);
    csvwrite('aa2.csv',yimag);

    for n=1:2^17
   y(n)=y_channel(n)*exp(-1*j*(fc+df*2)*2*pi*n/fs);
   end
   for n=2^17:2^17+10000
   y(n)=0;
   end
   yreal1=real(y);
   ymax1=max(abs(yreal1));
   yreal1=yreal1/ymax1;
   yreal1=yreal1';
   yimag1=imag(y);
   y11max=max(abs(yimag1));
   yimag1=yimag1/y11max;
   yimag1=yimag1';
    csvwrite('aa3.csv',yreal1);
    csvwrite('aa4.csv',yimag1);
    plot(n,y);

