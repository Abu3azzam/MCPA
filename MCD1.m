 %ELEC 4700 MonteCarlo PA Assignment
 %1-D Electron simulation 
 %PA#3
 %Name: Abdullah Abushaban 
 %Student#: 101089570



 clear
 clc

a = 1; 

x = zeros(a,1);

xp = 0;  % x position of the vector 

v = 0; % velocity  

v = zeros(a,1); % velocity vector

t = 0; % initial time

dt = 1;


F = 1; % Default Force
m = 1; % Default Mass

steps = 150; 

rS = 0; % default restart velocity 


pS = 0.05; % given probability of scattering for each time step 

T = 20; %  Tau assumption.

for i = 2: steps
    
    t(i) = t(i-1) + dt;
    v(:,i) = v(:,i-1) + F/m*dt;
    x(:,i) = x(:,i-1) + v(:,i-1)*dt + (F/m * dt^2)/2; 
    
    pS = 1 - exp(-dt/T); 
    r = rand(a,1) < pS;    
    v(r,i) = rS*v(r,i);
    vAv(i,:) = mean(v,2);
    
    
    % Time
    
    subplot(3,1,1), plot(t,v,'r');
    grid off;
    hold on;
    subplot(3,1,1), plot(t,vAv,'g');
    hold off;
    xlabel('Time')
    ylabel('Velocity')
    title(['Average V: ', num2str(vAv(i,:)/1e7)])
    
    % Position 
    
    subplot(3,1,2), plot(x(1,:),v,'b');
    grid off;
    hold on;
    subplot(3,1,2), plot(x(1,:),vAv,'g');
    hold off;    
    xlabel('X')
    ylabel('Velocity')
        
    % Position vs Time
    
    subplot(3,1,3), plot(t,x,'k');
    grid off;
    xlabel('Time')
    ylabel('X')     
      
    pause(0.01)
end 

