% This program solves the equilibrium strategies and also return regimes.
% Files to run this program are found in readme.txt.  Regime 1 = nobody
% manipulates, Regime 2 = L manipulates, Regime 3 = H manipulates, and
% Regime 4 = both manipulates.  Regime 5 is the situation where muptiple
% regimes stand together or no equilibrium.  When Regime 5 happens, the
% program stops.

% In the folder "sim2," results are saved in u = 0.5 r = 0.5, u = 0.2 and u = 0.8 while r = 0.5; & r = 0.2 and r = 0.8 while u = 0.5;

clear;
clc;

%EndT = 200;
%EndT_new = 201; %The number of periods: T - t0 + 1 for recursive case and T - t0 for initial run

u = 0.5;
T = 4;  % This has to be updated depending on whether or not doing recursively.

nu = 0.5;
N = 10;
r = 0.5;
b = zeros(N+1, N+1,1);
F = zeros(N+1,N+1, 1);
mL = zeros(N, N,1);
mH = zeros(N, N, 1);
mdhl = zeros(N, N, 1);
VL = zeros(N+1,N+1, T);
VH = zeros(N+1, N+1,T);
DL = zeros(N+1,N+1, T);
DH = zeros(N+1, N+1,T);
Regime = zeros(N+1,N+1, T);
BID = zeros(N+1,N+1, T);
ASK = zeros(N+1,N+1, T);
LS = zeros(N+1, N+1,T);
HB = zeros(N+1, N+1,T);
LB0 = zeros(N+1, N+1,T);
LS0 = zeros(N+1, N+1,T);
HB0 = zeros(N+1, N+1,T);
HS0 = zeros(N+1, N+1,T);
LBL = zeros(N+1, N+1, T);
LSL = zeros(N+1, N+1, T);
HBL = zeros(N+1, N+1, T);
HSL = zeros(N+1, N+1,T);
LBH = zeros(N+1, N+1,T);
LSH = zeros(N+1, N+1,T);
HBH = zeros(N+1, N+1,T);
HSH = zeros(N+1, N+1,T);
canHB = zeros(N+1, N+1,T);
canLS = zeros(N+1, N+1,T);
canSS = zeros(N+1, N+1,T);
canBB = zeros(N+1, N+1,T);
R0 = zeros(N+1, N+1,T);
RL = zeros(N+1, N+1,T);
RH = zeros(N+1, N+1, T);
RHL = zeros(N+1, N+1,T);
DL0 = zeros(N+1, N+1,T);
DH0 = zeros(N+1, N+1,T);
% DLwHL = zeros(N+1, N+1);
% DHwHL = zeros(N+1, N+1);
XH = zeros(N+1, N+1,T);
keyL = zeros(N+1,N+1, T);
keyH = zeros(N+1, N+1,T);
keyML = zeros(N+1,N+1, T);
keyMH = zeros(N+1,N+1, T);
dffH = zeros(N+1, N+1,T);
   dffL0 = zeros(N+1, N+1,T);
   indLHB = zeros(N+1, N+1,T);
   indHLS = zeros(N+1, N+1,T);
   dffH0 = zeros(N+1, N+1,T);
   dffL = zeros(N+1, N+1,T);
   honeLS = zeros(N+1,N+1, T);
   honeLB = zeros(N+1, N+1,T);
   honeHS = zeros(N+1,N+1, T);
   honeHB = zeros(N+1, N+1,T);
       LBHL = zeros(N+1, N+1, T);
       LSHL = zeros(N+1, N+1, T);
       HBHL = zeros(N+1, N+1,T);
       HSHL = zeros(N+1,N+1, T);
       errorH = zeros(N+1, N+1,T);
       errorL = zeros(N+1,N+1, T);
RHL2 = zeros(N+1, N+1,T);
x_ini = zeros(N+1,1);
y_ini = zeros(N+1,1);
biHL = 0;
       asHL = 0;
% b = zeros(N+1, 1);
% F = zeros(N+1, 1);
% mL = zeros(N, 1);
% mH = zeros(N, 1);
% mdhl = zeros(N, 1);
% VL = zeros(N+1, T);
% VH = zeros(N+1, T);
% DL = zeros(N+1, T);
% DH = zeros(N+1, T);
% Regime = zeros(N+1, T);
% BID = zeros(N+1, T);
% ASK = zeros(N+1, T);
% LS = zeros(N+1, T);
% HB = zeros(N+1, T);
% LB0 = zeros(N+1, T);
% LS0 = zeros(N+1, T);
% HB0 = zeros(N+1, T);
% HS0 = zeros(N+1, T);
% LBL = zeros(N+1, T);
% LSL = zeros(N+1, T);
% HBL = zeros(N+1, T);
% HSL = zeros(N+1, T);
% LBH = zeros(N+1, T);
% LSH = zeros(N+1, T);
% HBH = zeros(N+1, T);
% HSH = zeros(N+1, T);
% canHB = zeros(N+1, T);
% canLS = zeros(N+1,T);
% canSS = zeros(N+1, T);
% canBB = zeros(N+1, T);
% R0 = zeros(N+1, T);
% RL = zeros(N+1, T);
% RH = zeros(N+1, T);
% RHL = zeros(N+1, T);
% DL0 = zeros(N+1, T);
% DH0 = zeros(N+1, T);
% DLwHL = zeros(N+1, N+1);
% DHwHL = zeros(N+1, N+1);
% XH = zeros(N+1, T);
% keyL = zeros(N+1, T);
% keyH = zeros(N+1, T);
% keyML = zeros(N+1, T);
% keyMH = zeros(N+1, T);
% dffH = zeros(N+1, T);
%    dffL0 = zeros(N+1, T);
%    indLHB = zeros(N+1, T);
%    indHLS = zeros(N+1, T);
%    dffH0 = zeros(N+1, T);
%    dffL = zeros(N+1, T);
%    honeLS = zeros(N+1, T);
%    honeLB = zeros(N+1, T);
%    honeHS = zeros(N+1, T);
%    honeHB = zeros(N+1, T);
%        LBHL = zeros(N+1, T);
%        LSHL = zeros(N+1, T);
%        HBHL = zeros(N+1, T);
%        HSHL = zeros(N+1, T);
%        errorH = zeros(N+1, T);
%        errorL = zeros(N+1, T);
% RHL2 = zeros(N+1, T);
% x_ini = zeros(N+1,1);
% y_ini = zeros(N+1,1);
% biHL = 0;
%        asHL = 0;

tol = 10^(-12);
maxK = 20;
test = [];

%Defining intervals for belief from 0 to 1.  Each interval is 1/N long.
b(1) = 0;
for i=2:N+1
b(i) = (i-1)/N;
end

b0 = b;
b1 = b;

%Defining the last period value function for initial run.
for j=1:N+1 
for i=1:N+1
    hb = 1;
    ls = 1;
    ASK(i,j, 1) = ask(b0(i), b1(j),r, hb, ls,nu);
    BID(i,j, 1) = bid(b0(i), b1(j),r, hb, ls,nu);
    VL(i,j,1) = BID(i,j, 1); %The value function in the last period.  Prior in the last period is b(i).
    VH(i,j,1) = (1 - ASK(i,j, 1)); %The value function in the last period.
    Regime(i,j,1) = 0;
    LS(i,j,1) = 1;        
    HB(i,j,1) = 1;
end
end

%When L manipulates & H does not.
%H = (1-u)*r + u;

%When H manipulates & L does not.
%L = (1-u)*(1-r) + u;

%/Users/shinotakayama/Dropbox
%load('../sim/test.mat');
%load('../sim2/lstexitvu4.mat');
%VL(:,1) = LSTVL;
%VH(:,1) = LSTVH;
%VL(:,1) = VL35;
%VH(:,1) = VH35;
%%Replace Ends

%%

%Now we start with the second-period.
t = 2;
MaxR = 1;
while t <= T && MaxR <= 5
    for i = 1:N
        for j = 1:N
        dhl(i,j) = VL(i,j,t-1) - VH(i,j,t-1);   % differnece in continuation value for the high type and low type for each (b_0, b_1) pair.
        vl_1(i, j) = VL(i,j+1,t-1) - VL(i,j,t-1);  % For the LOW type and for each b_0, changes in value when b_1 changes.
        vl_0(i, j) = VL(i+1, j, t-1) - VL(i, j, t-1); % For the LOW type and for each b_1, changes in value when b_0 changes.
        vh_1(i,j) = VH(i,j+1,t-1) - VH(i,j,t-1); % For the HIGH type and for each b_0, changes in value when b_1 changes
        vh_0(i,j) = VH(i,j+1,t-1) - VH(i,j,t-1);  % For the HIGH type and for each b_1, changes in value when b_0 changes
        
        mL_b1(i, j) = vl_1(i, j)/(b(j+1) - b(j));
        mL_b0(i,j) = vl_0(i, j)/(b(i+1) - b(i));
        mH_b1(i, j) = vh_1(i,j)/(b(j+1) - b(j));
        mH_b0(i, j) = vh_0(i,j)/(b(i+1) - b(i));
        %         vl_1 = VL(:, :, t-1);
        vl(i,j) = VL(i, j, t-1);
        vh(i,j) = VH(i, j, t-1);
        end
    end 
    
     i =1;
     while i<= N
         j = 1;
         while j <= N
             [DL0(i, j, t), DH0(i,j,t),honeLS(i,j,t), honeLB(i,j,t), honeHS(i, j, t), honeHB(i,j,t), AK(i,j,t), cASK(i,j,t)] = diffun(i, j, r, 1, 1, nu, b, b0, b1, N, mL_b1, mH_b1, vl, vh);
%                [DL0(i,t), DH0(i,t), honeLS(i, t), honeLB(i, t), honeHS(i, t), honeHB(i, t)] = diffun(u, r, i, N, b, 1, 1, mL, mH, vl, vh);
%    diffun(i, j, r, hb, ls, nu, b, N, ml1, mh1, vl, vh)
             j = j+1;
         end
         i = i+1;
     end
%      VL(N+1,t)= valueL(bid(b(N+1), u, r, 1, 1), u, r, VL(N+1, t-1), VL(N+1, t-1));
% VH(N+1,t)= valueH(ask(b(N+1), u, r, 1, 1), u, r, VH(N+1, t-1), VH(N+1, t-1));
% ASK(N+1, t) = ask(b(N+1), u, r, 1, 1);
% BID(N+1, t) = bid(b(N+1), u, r, 1, 1);
% Regime(N+1, t) = 1;
% LS(N+1, t) = 1;        
% HB(N+1, t) = 1;
% MaxR = max(Regime(:,t));
    t = t+1;
end
%%
%Now we start with the second-period.
t = 2;
MaxR = 1;
while t <= T && MaxR <= 5
    vl = VL(:, :, t-1);
    vh = VH(:, :, t-1);
    dhl = VL(:, :, t-1) - VH(:, :, t-1);
    for j = 1:N
    mL(j) = (vl(j+1) - vl(j))/(b(j+1) - b(j));
    mH(j) = (vh(j+1) - vh(j))/(b(j+1) - b(j));
    mdhl(j) = (dhl(j+1) - dhl(j))/(b(j+1) - b(j));
    end
    i = 1; %i is the range for belief.
while i <= N
    % When keyL > keyML, L manipulates and keyH > keyMH, H manipulates.
    
    %K = fd(i,N+1,b,ASK(i, 1));
    %J = fd(1,i,b,BID(i, 1));
    %vlask = nextvalue(ASK(i,1), K, b, mL, vl);
    %vlbid = nextvalue(BID(i,1), J, b, mL, vl);
    %vhask = nextvalue(ASK(i,1), K, b, mH, vh);
    %vhbid = nextvalue(BID(i,1), J, b, mH, vh);
    
   %keyL(i,t)=(vlask - vlbid)/(ASK(i,1) - BID(i,1)); %[VL(A)-VL(B)]/[A-B]
   %keyH(i,t)=(vhbid - vhask)/(ASK(i,1) - BID(i,1)); %[VH(B)-VH(A)]/[A-B]
   %keyML(i,t)=(ASK(i,1) + BID(i,1))/(ASK(i,1) - BID(i,1)); %[A+B]/[A-B]
   %keyMH(i,t)=(2 - ASK(i,1) - BID(i,1))/(ASK(i,1) - BID(i,1)); %[2 - A - B]/[A-B]
   
%Studying for Regime Nobody (1)
   %[R0(i,t), bi, as] = incentive(u, r, i, N, b, mL, vl, mH, vh);
   %[LB0(i, t), LS0(i, t), HB0(i, t), HS0(i, t)] = profits(bi, as, b, i, N, vl, vh, mL, mH);
   [DL0(i,t), DH0(i,t), honeLS(i, t), honeLB(i, t), honeHS(i, t), honeHB(i, t)] = diffun(u, r, i, N, b, 1, 1, mL, mH, vl, vh);
   
if DL0(i, t) >= 0 && DH0(i, t) >= 0
       R0(i, t) = 1;
else
%Studying for Regime L (2)
   indLHB(i,t) = indfLbyH(u, r, L, i, b, N, mL, vl);
   [RL(i,t), biL, asL, canLS(i,t)] = checkL(u, r, H, i, b, N, mL, vl);
   %[LBL(i, t), LSL(i, t), HBL(i, t), HSL(i, t)] = profits(biL, asL, b, i, N, vl, vh, mL, mH);
   %dffH0(i, t) = HBL(i, t) - HSL(i, t);
   %dffL(i, t) = LSL(i, t) - LBL(i, t);

[dffL(i, t), dffH0(i, t), LSL(i, t), LBL(i, t), HSL(i, t), HBL(i, t)] = diffun(u, r, i, N, b, 1, canLS(i, t), mL, mH, vl, vh);
   
   if RL(i, t) == 1
       if dffH0(i, t) < 0
           RL(i, t) = 0;
       end
   end
   
%Studying for Regime H (3)
   indHLS(i,t) = indfHbyL(u, r, H, i, b, N, mH, vh);
   [RH(i,t), biH, asH, canHB(i,t)] = checkH(u, r, L, i, b, N, mH, vh);
   %[LBH(i, t), LSH(i, t), HBH(i, t), HSH(i, t)] = profits(biH, asH, b, i, N, vl, vh, mL, mH);
   %dffH(i, t) = HBH(i, t) - HSH(i, t);
   %dffL0(i, t) = LSH(i, t) - LBH(i, t);
   
[dffL0(i, t), dffH(i, t), LSH(i, t), LBH(i, t), HSH(i, t), HBH(i, t)] = diffun(u, r, i, N, b, canHB(i, t), 1, mL, mH, vl, vh);
   if RH(i, t) == 1
       if dffL0(i, t) < 0
           RH(i, t) = 0;
       end
   end
end   

%Studying for Regime HL (4)
   if DL0(i,t) < 0 && DH0(i, t) < 0 && (indLHB(i,t)-canHB(i,t))*(indHLS(i,t)-canLS(i,t)) > 0
       edge = [canHB(i, t), indHLS(i, t), indLHB(i, t), canLS(i, t)];
       if i == 51 && t == 29;
           edge51 = edge
       end
   [newh, newl, ke] = fixedHL(u, r, i, b, N, mL, vl, mH, vh, edge, tol, maxK);
   if i == 50;
       key50 = ke;
       keyh = newh;
       keyl = newl;
   end
   if newh > 1 - newl && newh >= 0 && newl >= 0 && newh <= 1 && newl <= 1;
       canBB(i,t) = newh;
       canSS(i,t) = newl;
       biHL = bid(b(i), u, r, canBB(i,t), canSS(i,t));
       asHL = ask(b(i), u, r, canBB(i,t), canSS(i,t));
       RHL(i,t) = 1;
   end
   end       
   
   if RHL(i, t) == 1
       [LBHL(i, t), LSHL(i, t), HBHL(i, t), HSHL(i, t)] = profits(biHL, asHL, b, i, N, vl, vh,  mL, mH);
       errorH(i, t) = HBHL(i, t) - HSHL(i, t);
       errorL(i, t) = LSHL(i, t) - LBHL(i, t);
       if abs(errorH(i, t) - errorL(i, t)) > tol;
           RHL(i, t) = 0;
       end
   end

% Allocating Regimes to each Belief
       if R0(i, t) == 1 && RL(i, t) == 0 && RH(i, t) == 0  && RHL(i,t) == 0
           Regime(i, t) = 1; %Honest trade is an equilibrium.
           LS(i, t) = 1;        
           HB(i, t) = 1;
           ASK(i, t) = ask(b(i), u, r, 1, 1);
           BID(i, t) = bid(b(i), u, r, 1, 1);           
       elseif R0(i, t) == 0 && RL(i, t) == 1 && RH(i, t) == 0 && RHL(i,t) == 0
            Regime(i, t) = 2; %Low manipulates and high does not.
            BID(i, t) = biL;
            ASK(i, t) = asL;
            LS(i, t) = canLS(i, t);
            HB(i, t) = 1;
       elseif R0(i, t) == 0 && RH(i, t) == 1 && RL(i, t) == 0 && RHL(i,t) == 0
            Regime(i, t) = 3; %High manipulates and low does not.
            BID(i, t) = biH;
            ASK(i, t) = asH;
            LS(i, t) = 1;        
            HB(i, t) = canHB(i, t);
       elseif R0(i, t) == 0 && RH(i, t) == 0 && RL(i, t) == 0  && RHL(i, t) == 1
            Regime(i, t) = 4; %Both manipulate.
            BID(i, t) = biHL;
            ASK(i, t) = asHL;
            LS(i, t) = canSS(i, t);        
            HB(i, t) = canBB(i, t);
       elseif R0(i, t) == 0 && RH(i, t) == 1 && RL(i, t) == 1  && RHL(i, t) == 1
           Regime(i, t) = 5; %Multiple equilibria -then choose High's strategy.
           BID(i, t) = biH;
           ASK(i, t) = asH;
           LS(i, t) = 1;        
           HB(i, t) = canHB(i, t);
       elseif R0(i, t) == 0 && RH(i, t) == 0 && RL(i, t) == 1  && RHL(i, t) == 1
           Regime(i, t) = 63; %Any other situation.
           BID(i, t) = biHL;
            ASK(i, t) = asHL;
            LS(i, t) = canSS(i, t);        
            HB(i, t) = canBB(i, t);        
       elseif R0(i, t) == 0 && RH(i, t) == 1 && RL(i, t) == 0  && RHL(i, t) == 1
           Regime(i, t) = 62; %Any other situation.
           BID(i, t) = biHL;
            ASK(i, t) = asHL;
            LS(i, t) = canSS(i, t);        
            HB(i, t) = canBB(i, t);          
       elseif R0(i, t) == 0 && RH(i, t) == 1 && RL(i, t) == 1  && RHL(i, t) == 0
           Regime(i, t) = 64; %Any other situation.
           BID(i, t) = biHL;
            ASK(i, t) = asHL;
            LS(i, t) = canSS(i, t);        
            HB(i, t) = canBB(i, t);
       else
           Regime(i, t) = 7; %Any other situation.
           BID(i, t) = biHL;
            ASK(i, t) = asHL;
            LS(i, t) = canSS(i, t);        
            HB(i, t) = canBB(i, t);                  
       end
        [VL(i, t), VH(i, t)] = value1(i, ASK(i, t), BID(i, t), b, u, r, N, mL, vl, mH, vh);           
  i = i+1;
end
VL(N+1,t)= valueL(bid(b(N+1), u, r, 1, 1), u, r, VL(N+1, t-1), VL(N+1, t-1));
VH(N+1,t)= valueH(ask(b(N+1), u, r, 1, 1), u, r, VH(N+1, t-1), VH(N+1, t-1));
ASK(N+1, t) = ask(b(N+1), u, r, 1, 1);
BID(N+1, t) = bid(b(N+1), u, r, 1, 1);
Regime(N+1, t) = 1;
LS(N+1, t) = 1;        
HB(N+1, t) = 1;
MaxR = max(Regime(:,t));
%if MaxR >= 6
%    ExT = t;
%    LSTVL = VL(:,ExT - 1);
%    LSTVH = VH(:,ExT - 1);
%    save('../sim2/lstexitvu4.mat', 'LSTVL', 'LSTVH');
%    save('../sim2/exitvu4.mat', 'VL', 'VH', 'ASK', 'BID', 'Regime', 'LS', 'HB')
%end
t = t+1;
end

%Computing the slope of value functions in each point.
NewT = t - 1; %Loop ends at t+1 so bring it back to t
t=1;
while t <= NewT;
    i = 1;
    while i <= N;
        DL(i, t) = (VL(i+1, t) - VL(i, t))/(b(i+1)-b(i));
        DH(i, t) = (VH(i+1, t) - VH(i, t))/(b(i+1)-b(i));
        i = i + 1;
    end
    DL(N+1, t) = 0;
    DH(N+1, t) = 0;
    t = t + 1;
end

%/Users/shinotakayama/
    VL_ter = VL(:,NewT);
    VH_ter = VH(:,NewT);
    tarL = u*VL_ter;
    tarH = u*VH_ter;
%    save('../sim3/mu_4.mat', 'VL_ter', 'VH_ter', 'tarL', 'tarH')

%save('../sim2/man_new400.mat');
figure
plot(b, tarH, b, tarL)

figure
plot(b, VH, b, VL)

figure
plot(b, ASK, b, BID)

figure
mesh(Regime)