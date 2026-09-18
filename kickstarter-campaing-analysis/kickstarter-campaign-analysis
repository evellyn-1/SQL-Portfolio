# Kickstarter Campaign Analysis

## Kontext
Fiktives Szenario aus der Rolle einer Data Analystin in einem Startup:
Das Produktteam plante den Launch einer Crowdfunding-Kampagne. Ziel der
Analyse war es, anhand historischer Kickstarter-Daten herauszufinden,
welche Faktoren über Erfolg oder Misserfolg einer Kampagne entscheiden.

## Verwendete SQL-Konzepte
- Filtering (WHERE, IN, mehrere Bedingungen kombiniert)
- Sortierung (ORDER BY, mehrstufig)
- Conditional Logic (CASE WHEN) zur Kategorisierung von Kampagnen
- Berechnete Kennzahlen (pledged / goal als Finanzierungsquote)

## Fragestellungen
- Welche Projektarten (Kategorien) sind wahrscheinlich erfolgreich, welche nicht?
- Scheitern Projekte an fehlenden Unterstützer:innen oder fehlendem Funding-Volumen?

## Beispielabfrage
```sql
SELECT main_category, backers, pledged, goal,
       pledged / goal AS pct_pledged,
  CASE
       WHEN pledged / goal >= 1 THEN 'Fully funded'
       WHEN pledged / goal BETWEEN .75 AND 1 THEN 'Nearly funded'
       WHEN pledged / goal < .75 THEN 'Not nearly funded'
       END AS funding_status
  FROM ksprojects   
 WHERE state IN ('failed')
   AND backers >= 100 AND pledged >= 20000
ORDER BY main_category, pct_pledged DESC
 LIMIT 10;
```
Diese Abfrage untersucht gescheiterte Projekte, die trotzdem mindestens
100 Unterstützer:innen und CHF 20'000 an Zusagen erreicht hatten und
ordnet sie nach Kategorie und Finanzierungsquote.

## Erkenntnisse
- Auch Projekte mit über 100 Unterstützer:innen und mehr als CHF 20'000
  an Zusagen scheiterten teilweise am Zielbetrag (state = failed).
- Das widerlegt die naheliegende Annahme, gescheiterte Kampagnen hätten
  schlicht zu wenig Unterstützer:innen oder zu wenig Geld eingesammelt.
- Der Misserfolg lag also vermutlich an anderen Faktoren (z. B. zu hoch
  angesetztes Finanzierungsziel, Kategorie, Kampagnendauer), die mit
  den vorhandenen Daten allein nicht abschliessend erklärbar sind.

## Dateien
- `kickstarter_analyse.sql` – vollständige SQL-Abfragen mit Kommentaren
