# Modal_Analysis_Rayleigh_quotient
Rayleigh quotient algorithm for modal analysis of structures

**L’algorithme pour le calcul des pulsations et modes propres en utilisant la méthode des puissances inverses de Rayleigh (décalage) :**

Le calcul des pulsations et modes propres est composé en deux parties :
A. Calcul de la pulsation fondamentale 𝜔1, à l’aide de la méthode d’itération matricielle inverse.
B. Calcul des pulsations supérieures à l’aide de la méthode de décalage spectral.


Calcul de la pulsation fondamentale :
La procédure itérative pour la détermination de la pulsation fondamentale est :
1) Assigner la tolérance ;
2) Assigner $𝑅 = 1$ ;
3) Donner une approximation initiale à ${\{𝐴\}}_1$ ;
4) Déterminer ${\{𝐴\}}_{𝑗+1}$ :

$${\{𝐴\}}_{𝑗+1}={[ \𝐾] \}^{−1}[ \𝑀] \{\{𝐴\}}_𝑗$$
