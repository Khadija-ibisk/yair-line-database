# ✈️ YAir Line – Conception d'une base de données aéronautique

![MySQL](https://img.shields.io/badge/MySQL-8.0-4479A1?logo=mysql&logoColor=white)
![Merise](https://img.shields.io/badge/m%C3%A9thode-Merise-orange)

Projet de **modélisation et SQL** (Bachelor 2, Ynov Campus) : concevoir et implémenter le système d'information
de la compagnie aérienne fictive **YAir Line**, de l'analyse des besoins jusqu'à la base MySQL.

## 🧭 Démarche

1. **Analyse des règles de gestion** : employés, flotte, routes, vols programmés, départs, passagers, billets.
2. **MCD** (modèle conceptuel) puis **MLD** (modèle logique) selon la méthode Merise.
3. **MPD** et implémentation SQL sous MySQL, modélisée dans **MySQL Workbench**.
4. Jeu de données de test.

## 🗂️ Modèle de données

| Table | Description | Points notables |
|---|---|---|
| `Employe` | Pilotes, équipage et personnel au sol | `ENUM` du type d'employé + **contrainte `CHECK`** : licence obligatoire pour un pilote, fonction obligatoire pour l'équipage |
| `Avion` | Flotte | Type et capacité |
| `Route` | Liaisons ville d'origine → destination | |
| `Vol` | Vol programmé sur une période de validité | Clés étrangères vers `Route` et `Avion` |
| `Depart` | Occurrence datée d'un vol | Places libres et occupées |
| `Passager` | Clients | |
| `Billet` | Réservation d'un passager sur un départ | |
| `Participation` | Association employés ↔ départs | Table d'association (relation N–N) |

## 📁 Contenu

```
├── sql/yair_line.sql      # création de la base, des 8 tables, contraintes et données de test
├── modele/yair_line.mwb   # modèle MySQL Workbench (diagramme EER)
└── docs/                  # rapports et présentation du projet
```

## ▶️ Installer la base

```bash
mysql -u root -p < sql/yair_line.sql
```

Ou ouvrir `modele/yair_line.mwb` dans MySQL Workbench pour visualiser le diagramme.

## 🛠️ Compétences

`Merise (MCD / MLD / MPD)` · `MySQL` · `MySQL Workbench` · `contraintes d'intégrité` · `clés étrangères` · `modélisation relationnelle`

---
Khadija Ibisk – Bachelor Dev IA & Data Engineering, Ynov Campus
