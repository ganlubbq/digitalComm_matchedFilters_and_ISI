function [ ] = p2(sigma)
    A = 1;
    T = 10;
    t = (1:10/T:T);
    
    s0 = [];
    s1 = [];
    n = (sigma)^2 .* randn(1,T);
    r0 = [];
    r1 = [];
    match0 = [];
    match1 = [];
    
    for i=1:T
        s0p = A*cos(pi*i/T);
        s0 = [s0 s0p];
        
        s1p = A*cos(2*pi*i/T);
        s1 = [s1 s1p];
    end
    for k=1:10/T:T
        r0p = (s0(floor(k)) + n(floor(k)));
        r0 = [r0 r0p];
        match0 = [match0 (conv(s0(floor(k)),r0p))];
        
        r1p = (s1(floor(k)) + n(floor(k)));
        r1 = [r1 r1p];
        match1 = [match1 (conv(s1(floor(k)),r1p))];
    end
    x = (1:10);
    subplot(3,1,1);
    plot(x,s0, x, s1);
    legend('s0','s1');
    
    subplot(3,1,2);
    plot(x,r0,x,r1);
    legend('r0','r1');
    
    subplot(3,1,3);
    plot((1:10),match0,(1:10),match1);
    legend('r0 * s0','r1 * s1');
end