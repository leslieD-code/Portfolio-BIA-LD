# Projet 6 – Optimisez la gestion & nettoyez les données du stock d'une boutique

![Statut](https://img.shields.io/badge/Projet-Terminé-brightgreen)  
![Outil](https://img.shields.io/badge/Outil-Python-yellow)  
![Librairie](https://img.shields.io/badge/Librairies-pandas%20%7C%20matplotlib-blue)

Ce dossier contient les livrables du **Projet 6 – Optimisez la gestion & nettoyez les données du stock d’une boutique** du Bachelor **Business Intelligence Analyst**.

## 📑 Livrables
- 🐍 [Notebook Jupyter (Python)](Deluy_Leslie_1_notebook_072025.ipynb)
  ## 📂 Données utilisées
- 📊 [ERP](data/erp.xlsx)
- 🌐 [Web](data/web.xlsx)
- 🔗 [Fichier de liaison](data/liaison.xlsx)

ℹ️ Les fichiers sources sont placés dans le dossier `data/` afin d’assurer une bonne organisation du projet.  
Cette structure permet de séparer le code (notebook) des données brutes et garantit que le notebook peut être réexécuté facilement.  

Dans le code, les fichiers sont appelés avec un chemin relatif, par exemple :  

python :
df_erp = pd.read_excel("data/erp.xlsx")
df_web = pd.read_excel("data/web.xlsx")
df_liaison = pd.read_excel("data/liaison.xlsx")


- 📄 [Version PDF du notebook](Deluy_Leslie_1_notebook_072025.pdf)
- 🎥 [Présentation PowerPoint](Deluy_Leslie_2_présentation_072025.pptx)

ℹ️ Une version PDF du notebook est fournie pour faciliter la lecture.  
Elle contient le code et les résultats principaux, même sans installer Jupyter.


## 🎯 Objectifs du projet
- Nettoyer et préparer un jeu de données réel (stock d’une boutique)
- Détecter et traiter les **valeurs aberrantes** et les **données manquantes**
- Analyser la rotation des stocks et calculer les **indicateurs de gestion**
- Fournir un reporting clair et visuel

## 🛠 Compétences mobilisées
- Manipulation de données avec **pandas**
- Visualisation avec **matplotlib**
- Application de méthodes de détection d’outliers (**IQR, Z-score**)
- Structuration et présentation des résultats d’analyse

## 👀 Aperçu
<img width="819" height="619" alt="image" src="https://github.com/user-attachments/assets/16f2df32-9fe3-4309-abda-b3d65cbabce9" />  <img width="1586" height="902" alt="image" src="https://github.com/user-attachments/assets/88f8bfac-e9cf-458c-aa17-55a7b8385a75" />


