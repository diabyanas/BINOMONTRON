#CONNEXION A LA BASE DE DONNEES
import mysql.connector as mysql
user = 'root'
password = 'example'
host = 'localhost'
port = '3307'
database = 'binomontron'

bdd = mysql.connect(user=user,password=password,host=host,port=port,database=database)
cursor = bdd.cursor()

#CREATION DE LA LISTE DES APPRENANTS

query='SELECT * FROM apprenants'
cursor.execute(query)

liste_apprenants =[]
for b in cursor:
    liste_apprenants.append(list(b[1:3]))
#print(liste_apprenants)


#CREATION DES DIFFERENTS GROUPES

import random
#importer la fonction random pour aléatoire

groupes = []
#création de la liste 'groupes' dans laquelle sera stockés les groupes

x = int(input("Entrer le nombre de personne par groupe: "))
#x est un entier, représentant le nombre de personne par groupe
#et qui est déterminé par l'utilisateur via input
while len(liste_apprenants) >= x:
    #len = longueur de la liste
    #tant que la longueur de la liste est >= x la boucle se fait
    #print(random.sample(liste, k = x))
    groupe = random.sample(liste_apprenants, k = x)
    #sample à deux paramètres (l'endroit d'où l'on prend les infos et k le nb d'élément tiré)
    #permet de tirer au hasard de la liste apprenants le nombre x décidé de personnes
    groupes.append(groupe)
    #les éléments tirés forment un groupe, ici on les ajoute à la liste 'groupes' où se trouvera tous
    #les groupes
    for apprenant in groupe:
        liste_apprenants.remove(apprenant)
    #pour 'apprenant' tirés, on les retire de la 'liste' pour éviter 2 tirages

if len(liste_apprenants)>0:
#si la longueur de 'liste' est inférieur à x mais non nulle, c'est qu'il reste des apprenants
    groupes.append(list(liste_apprenants))
    #les éléments restant de 'liste' forment'groupe', on l'ajoute à la liste 'groupes'
    liste_apprenants.clear()
    #vider la 'liste'

i = 0
while len(groupes) > i:
    print(f"groupe {i+1} :", groupes[i])
    i += 1
#print(liste_apprenants)
bdd.close()