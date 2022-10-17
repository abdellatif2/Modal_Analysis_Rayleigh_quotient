# Rayleigh quotient algorithm for modal analysis of structures

**L’algorithme pour le calcul des pulsations et modes propres en utilisant la méthode des puissances inverses de Rayleigh (décalage) :**

Le calcul des pulsations et modes propres est composé en deux parties :
A. Calcul de la pulsation fondamentale 𝜔1, à l’aide de la méthode d’itération matricielle inverse.
B. Calcul des pulsations supérieures à l’aide de la méthode de décalage spectral.


**Calcul de la pulsation fondamentale :**
La procédure itérative pour la détermination de la pulsation fondamentale est :
1) Assigner la tolérance ;
2) Assigner $𝑅 = 1$ ;
3) Donner une approximation initiale à ${\{𝐴\}}_1$ ;
4) Déterminer ${\{𝐴\}}_{𝑗+1}$ : 

<img src="https://latex.codecogs.com/svg.image?\left&space;[&space;A&space;\right&space;]_{j&plus;1}=[K]^{-1}[M]\left\{&space;A\right\}_{j}"/>

5) Calculer l’estimation de la pulsation propre en calculant R :

<img src="https://latex.codecogs.com/svg.image?R_{j&plus;1}=\frac{\left\{A\right\}_{j&plus;1}^{T}[K]\left\{A\right\}_{j}}{\left\{A\right\}_{j&plus;1}^{T}[M]\left\{A\right\}_{j&plus;1}}"/>

6) Vérifier la convergence :

<img src="https://latex.codecogs.com/svg.image?\frac{R_{j&plus;1}-R_j}{R_{j&plus;1}}\leq&space;Tolarence"/>

7) Retourner à l’étape 3 pour faire une nouvelle itération.
8) Quand le critère de tolérance est vérifié (à l’itération finale l), calculer la pulsation fondamentale et les modes propres :

<img src="https://latex.codecogs.com/svg.image?\left\{\begin{matrix}\omega_{1}^{2}=R_l&space;\\&space;\left\{\phi\right\}_1=\frac{\left\{A\right\}_l}{\sqrt{\left\{A\right\}_{l}^{T}[M]\left\{A\right\}_{l}}}\end{matrix}\right."/>

**Calcul des pulsations supérieures :**
1) Assigner la tolérance ;
2) Donner une approximation initiale à ${\{𝐴\}}_{1}$ ;
3) Donner une approximation initiale à 𝜇, $\lambda_1$ ;
4) Déterminer ${\{𝐴\}}_{𝑗+1}$ :
5) Obtenir une estimation de la pulsation propre :

<img src="https://latex.codecogs.com/svg.image?\lambda^{j&plus;1}=\lambda^{j}&plus;\frac{\left\{A\right\}_{j&plus;1}^{T}[M]\left\{A\right\}_{j}}{\left\{A\right\}_{j&plus;1}^{T}[M]\left\{A\right\}_{j&plus;1}}"/>

7) Normaliser le vecteur :

<img src="https://latex.codecogs.com/svg.image?\left\{A\right\}_{j&plus;1}=\frac{\left\{A\right\}_{j&plus;1}}{\sqrt{\left\{A\right\}_{j&plus;1}^{T}[M]\left\{A\right\}_{j&plus;1}}}"/>

9) Vérifier la convergence :

<img src="https://latex.codecogs.com/svg.image?\frac{\lambda^{j&plus;1}-\lambda^j}{\lambda^{j&plus;1}}\leq&space;Tolarence"/>

11) Quand le critère de tolérance est vérifié (à l’itération finale l), calculer la pulsation fondamentale et les modes propres :

<img src="https://latex.codecogs.com/svg.image?\left\{\begin{matrix}\omega_{i}^{2}=R_l;&space;\\\left\{\phi\right\}_i=\frac{\left\{A\right\}_l}{\sqrt{\left\{A\right\}_{l}^{T}[M]\left\{A\right\}_{l}}}\end{matrix}\right.&space;"/>
