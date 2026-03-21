# Screen: Payment Success

## Purpose

Potvrditi user-u da je plaćanje uspješno izvršeno i pružiti jasan dokaz (receipt).

Ovo je završni ekran checkout flow-a.

---

## Layout Structure

Ekran je podijeljen u 3 glavna dijela:

### 1. Success Indicator (Top)

- ikona uspjeha (npr. checkmark)
- kratka poruka:
  - "Payment successful"
  - ili lokalizovana verzija

---

### 2. Payment Summary

Prikaz ključnih informacija:

- merchant name
- amount
- datum i vrijeme
- reference / transaction ID

Ovo mora izgledati kao validna potvrda plaćanja.

---

### 3. Actions

User može:

- View receipt
- Share receipt
- Print receipt
- Done / Close

---

## Elements

### Success Message
- jasno i nedvosmisleno
- bez tehničkih termina

---

### Payment Info
- merchant name
- amount (dominantan)
- timestamp
- transaction ID

---

### Receipt Actions

#### View Receipt
- otvara detaljni slip

#### Share
- dijeljenje putem:
  - WhatsApp
  - email
  - sistem share (mobile)

#### Print
- print-friendly view

---

### Primary Action

- "Done" / "Close"
- vraća user-a nazad (ili zatvara flow)

---

## States

### Default (Success)
- sve informacije vidljive
- akcije dostupne

---

### Receipt Open
- prikazan detaljni slip
- fokus na dokaz plaćanja

---

## UX Requirements

- user mora odmah razumjeti da je plaćanje uspješno
- amount i merchant moraju biti jasno vidljivi
- ne smije biti konfuzije
- ekran mora izgledati kao:
  - potvrda
  - dokaz
  - završetak procesa

---

## Receipt Requirements

Receipt mora sadržavati:

- merchant name
- amount
- datum i vrijeme
- transaction ID
- status (successful)

---

## UX Requirements (Receipt)

- čitljiv i jednostavan layout
- optimizovan za:
  - mobile
  - print
- bez nepotrebnih elemenata
- mora izgledati kao validan dokaz

---

## UI Requirements

- success ikona mora biti jasno vidljiva
- amount mora biti naglašen
- spacing mora biti čist i pregledan
- akcije moraju biti lako dostupne

---

## Edge Cases

### Delayed Confirmation
- ako postoji kašnjenje:
  - prikazati privremeni status
  - automatski refresh ili update

---

## Notes for UI/UX

- ovo je ključni trust moment
- user često pokazuje ovaj ekran merchant-u
- ekran mora izgledati “sigurno” i “finalno”
- ne koristiti:
  - tehnički žargon
  - previše informacija

---

## Open Questions

- da li automatski otvarati receipt ili ne
- da li imati QR na receipt-u za verifikaciju (future)
- gdje vodi "Done" akcija:
  - nazad na merchant
  - zatvara web view