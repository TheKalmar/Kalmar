# Screen: Payment Failed

## Purpose

Obavijestiti user-a da plaćanje nije uspjelo i omogućiti mu jasan i brz sljedeći korak.

Cilj ovog ekrana nije samo informacija, već i:
- smanjenje frustracije
- omogućavanje ponovnog pokušaja (retry)

---

## Layout Structure

Ekran je podijeljen u 3 glavna dijela:

### 1. Failure Indicator (Top)

- ikona greške (npr. X ili warning)
- kratka poruka:
  - "Payment failed"
  - ili lokalizovana verzija

---

### 2. Error Explanation

- kratko objašnjenje (ako postoji)
- bez tehničkog žargona

Primjeri:
- "Vaša uplata je neuspješna..."
- "Molimo vas pokušajte opet"
- "Vaša kartica je odbijena"

---

### 3. Actions

User može:

- Ponovi Uplatu
- Izaberi drugi način plaćanja
- Cancel / Close

---

## Elements

### Failure Message
- jasno i nedvosmisleno
- ne optužuje user-a
- ne koristi tehničke termine

---

### Error Details (Optional)
- prikazati samo ako ima smisla
- npr:
  - insufficient funds
  - card declined
- ne prikazivati interne kodove grešaka

---

### Primary Action

#### Retry
- ponovni pokušaj sa istom metodom

---

### Secondary Actions

#### Change Payment Method
- vraća user-a na izbor metode plaćanja

#### Cancel / Close
- izlaz iz flow-a

---

## States

### Generic Failure
- nema specifičnog razloga
- fokus na retry

---

### Card Declined
- specifična poruka
- sugerisati drugu metodu

---

### Network / Timeout
- sugerisati retry

---

### Session Expired
- user mora ponovo pokrenuti flow

---

## UX Requirements

- poruka mora biti:
  - kratka
  - jasna
  - umirujuća

- uvijek ponuditi sljedeći korak:
  - retry
  - ili promjena metode

- ne blokirati user-a bez opcije

---

## Retry Behavior

- retry mora biti:
  - brz
  - bez ponovnog unosa ako nije potrebno

- ako retry ne uspije:
  - sugerisati promjenu metode

---

## UI Requirements

- failure ikona mora biti jasno vidljiva
- CTA (Retry) mora biti dominantan
- secondary akcije jasno odvojene
- layout mora biti čist i pregledan

---

## Edge Cases

### Multiple Failures
- nakon više neuspjelih pokušaja:
  - sugerisati drugu metodu plaćanja

---

### High Risk / Blocked
- ako je plaćanje blokirano:
  - prikazati generičnu poruku
  - ne otkrivati sigurnosne detalje

---

## Notes for UI/UX

- user je već frustriran → ne komplikovati
- cilj je:
  - smiriti user-a
  - dati mu kontrolu
  - omogućiti novi pokušaj

- izbjegavati:
  - tehničke poruke
  - crveni “error overload” dizajn
  - osjećaj da je sistem pokvaren

---

## Open Questions

- koliko puta dozvoliti retry bez dodatnih koraka
- kada automatski sugerisati drugu metodu
- da li prikazivati specifične razloge od banke ili uvijek generički