# Screen: Receipt (Slip)

## Purpose

Prikazati korisniku detaljan dokaz o uspješnom plaćanju.

Receipt mora:

- potvrditi da je plaćanje izvršeno
- pružiti sve ključne informacije
- biti pogodan za dijeljenje i print

---

## Entry Point

Receipt se otvara:

- klikom na "Pregledaj slip" na success ekranu
- automatski (opciono, ako se odluči u UX-u)

---

## Layout Structure

Ekran je podijeljen u 3 dijela:

### 1. Header

- naziv sistema (Kalmar)
- oznaka:
  - "Potvrda plaćanja"

---

### 2. Payment Details (glavni dio)

Prikaz svih ključnih informacija:

- merchant name
- amount (naglašen)
- datum i vrijeme
- transaction ID / referenca
- status:
  - "Uspješno plaćeno"

---

### 3. Actions

- Dijeli
- Print
- Zatvori

---

## Elements

### Merchant Info
- naziv trgovca

---

### Amount
- iznos
- valuta
- vizuelno najdominantniji element

---

### Date & Time
- jasno formatiran (npr. 21.03.2026 14:32)

---

### Transaction ID
- jedinstvena referenca
- može biti kraća verzija za prikaz

---

### Status
- "Uspješno plaćeno"
- vizuelno jasno (npr. zelena oznaka)

---

## Receipt Actions

### Dijeli
- koristi sistemski share (mobile)
- opcije:
  - poruke
  - email
  - aplikacije

---

### Print
- otvara print-friendly verziju
- minimalistički dizajn
- bez dodatnog UI-a

---

### Zatvori
- vraća user-a nazad ili zatvara flow

---

## States

### Default
- svi podaci prikazani
- akcije dostupne

---

### Print Mode
- pojednostavljen prikaz
- bez dugmadi
- fokus na tekst i podatke

---

## UX Requirements

- receipt mora biti:
  - jednostavan
  - jasan
  - čitljiv

- mora izgledati kao:
  - validan dokaz
  - nešto što se može pokazati merchant-u

- bez nepotrebnih informacija

---

## UI Requirements

- čist layout (card ili list)
- dovoljno whitespace-a
- jasan kontrast
- čitljiv font

---

## Optional Elements (Future)

- QR kod za verifikaciju transakcije
- logo merchant-a
- dodatni opis transakcije

---

## Edge Cases

### Missing Data
- fallback za nedostajuće podatke (npr. "--")

---

### Offline Access (future)
- mogućnost čuvanja receipt-a

---

## Notes for UI/UX

- user često pokazuje ovaj ekran drugoj osobi
- mora biti:
  - brz za razumjeti
  - vizuelno pouzdan

- izbjegavati:
  - kompleksne layout-e
  - tehničke termine
  - clutter

---

## Open Questions

- da li automatski otvarati receipt nakon success
- da li dodati QR za verifikaciju
- da li omogućiti download kao PDF (future)