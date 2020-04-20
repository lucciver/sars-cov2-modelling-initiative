function [etaOptimal, alphaOptimal, betaOptimal, gammaOptimal,lambda23Optimal,rOptimal,rhoBarOptimal,aOptimal] = getOptimalParameters1000()

%% parameters g�esses
eta_p = 0.4;
alpha_p=0.684959263243313;
beta_p=0.828926547877735;
gamma_p=0.695175205226680;

% these are fix 
lambda23=1/500;
r=1/1000;
rhoBar=2/3;

% initial guess for a
a =  1.038328665865816e-04;

params0 = [alpha_p, beta_p, gamma_p, a];

% Restrictions
A=[];
b=[];
Aeq=[];
beq=[];
lb=[0 0 0 0];
ub=[1 1 1 1];

options = optimset('Display','off');%,'MaxFunEvals',100000,'MaxIter',10000, 'TolX',1e-3,'TolFun',1e-4);%,'TypicalX',10*[1e-2,1e-3,1e-1,1e-2,1e-1,1,1,1e-1,1e-2,1]);

format long
[params,fval,exitflag] = fmincon(@calibrateMe1000,params0,A,b,Aeq,beq,lb,ub,[],options);

% for i=1:3
%    [params,fval,exitflag] = fmincon(@calibrateMe,params,A,b,Aeq,beq,lb,ub,[],options);
% end


alphaOptimal=params(1);
betaOptimal=params(2);
gammaOptimal=params(3);
etaOptimal=eta_p;
lambda23Optimal=lambda23;
rOptimal=r;
rhoBarOptimal=rhoBar;
aOptimal= params(4);
end

