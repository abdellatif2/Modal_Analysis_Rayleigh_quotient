%%
clc,clear all 
format short
warning('off')
%-----------------------------------------------%
% Script de calcul des pulsations et modes propres par 
%---- la méthode des puissances inverse de Rayleigh (décalage)
% 
% Ce script calcul les portique à t travées, ou la rigidité et la masse 
%---- d'étage est la meme pour chaque étage
%-----------------------------------------------%
% INPUTS
n= 7; % Degrée de liberté

E= 3.21*10^7*10^3; % Module de Young (N/m^2)
b= 0.4; % Longuer du poteau (m)
h= 0.4; % Largueur du poteau (m)
I= b*h^3/12; % Inertie de la section de poteau (m^4)
H= 3; % hauteur d'étage (m)
t=2; % nombre de travées

k= (t+1)*12*E*I/H^3; % rigidité de l'étage (N/m)
m= 2*10^4; % La masse du plancher (kg)
M= m*eye(n); % Matrice de masse
K=diag(2*k*ones(1,n))+diag(-k*ones(1,n-1),1)+diag(-k*ones(1,n-1),-1); % Matrice de rigidité
K(n,n)=k;

%-----------------------------------------------%
tic;
% Calcul des pulsations par la méthode directe (pour verification)
disp('les pulsations par la méthode direct:')
pulsations=flip(sqrt(roots(sym2poly(det(K-sym('x')*M)))))
disp("temps d’exécution-méthode directe-:")
toc
tic;
%% Calcul du mode fondamental 

A = rand(n,1); % Vecteur de mode arbitraire A
R = 1; % Quotient de Rayleigh
pulsation = 0; % Vecteur des Pulsations
erreur=10; % Initiation d'erreur
tol=10^-100; % Tolerence
i=2; % Indice d'incrémentation

while erreur > tol
    Aj1=inv(K)*M*A; % Calcul de Aj+1
    R(i)=(Aj1'*K*A)/(Aj1'*M*A); % Calcul de l'estimation de la pulsation propre
    erreur=abs((R(i)-R(i-1))/R(i)); % calcul du erreur
    A=Aj1; % mis à jour du valeur de A
    i=i+1; % incrémentation
end

%plot(2:length(R),R(2:end),'-X') 
%grid()
%xlabel('itération')
%ylabel('R')
%title('convergence de la solution ')

pulsation(end+1)=sqrt(R(end));
a=A/sqrt(A'*M*A);

fprintf("la pulsation fondamentale : %f rd/s \nla période propre : %f s\n", pulsation(2), 2*pi()/pulsation(2))
disp("les modes propres:")
phi=a/max(a)



%% Calcul des modes supérieurs

pas=100; % Initiation de pas de recherche
lambda=R(end); % approximation initial de décalage
erreur=10; % Initiation d'erreur
tol=10^-100; % Tolerence

while length(pulsation)~= n+1
    A=ones(n,1);% Vecteur de mode arbitraire A
    Z=M*A;
    lambda_=lambda;
for k=1:10 
    X=inv(K-lambda_*M)*Z;
    Zk=M*X;
    lambda_=(X'*Z)/(X'*Zk)+lambda_;
    Z=Zk/sqrt(X'*Zk);
end
if lambda_-pulsation(end)^2 >2
pulsation(end+1)=sqrt(lambda_);
fprintf("la pulsation du mode n:%d : %f rd/s \nla période propre : %f s\n", length(pulsation)-1, pulsation(end), 2*pi()/pulsation(end))
disp("les modes propres:")
phi=Z/max(abs(Z))
end
lambda=lambda+pas;
end
disp("temps d’exécution-méthode numérique-:")

toc
%% The sweep matrix method (from the ressource Sekaran Rajasekaran - Structural dynamics of earthquake engineering_ Theory and application using Mathematica and Matlab)
% pour titre de vérification des résultats de 1ere méthode
disp("The sweeping method")

A=ones(n,1);
S=eye(n); % initaition de sweeping matrix
for j=2:n
    S=S-a*a'*M;
    D=inv(K)*M*S;
    err=10;
    lambda_=0;


    while err > tol
        lambda=D*A;
        A=lambda/(lambda(n));
        err=abs((lambda_-lambda(n))/lambda(n));
        lambda_=lambda(n);

    end
    pulsation(end+1)=1/sqrt(abs(lambda(n)));
    a=A/sqrt(A'*M*A);

    fprintf("la pulsation du mode n:%d : %f rd/s \nla période propre : %f s\n", j, pulsation(end), 2*pi()/pulsation(end))
    disp("les modes propres:")
    oi=a/max(abs(a))

end
