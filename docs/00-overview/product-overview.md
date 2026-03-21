# kalmar – Product Overview

## What is kalmar

kalmar je QR + NFC payment platforma koja omogućava trgovcima da primaju uplate putem:

- kartičnog plaćanja (IPG)
- internog kredita (balance / gift credit)

Plaćanje se može pokrenuti na više načina:

- skeniranjem QR koda
- prislanjanjem telefona (NFC)
- otvaranjem direktnog payment linka

Cilj je omogućiti brže, jednostavnije i jeftinije plaćanje u odnosu na klasične POS terminale i kartične tokove.

---

## Core Idea

Merchant generiše payment session (QR, NFC ili link).

Customer može ući u payment flow na tri načina:

### QR flow
- skenira QR kod
- otvara payment page

### NFC flow
- prislanja telefon na NFC tag ili uređaj
- automatski otvara payment page

### Link flow
- otvara direktni payment link (npr. online ili putem poruke)

Nakon ulaska u flow:

- vidi merchant name i amount
- bira način plaćanja:
  - kartica
  - balance / gift credit (ako postoji)
- potvrđuje plaćanje
- dobija jasan rezultat (success ili fail)

Merchant:

- vidi sve transakcije u dashboardu
- ima jednostavan pregled uplata

---

## Target Users

### Merchant (trgovac)
- mali i srednji biznisi
- žele brzu naplatu bez komplikacija
- žele smanjiti troškove
- žele jednostavan onboarding

### Customer (kupac)
- želi brzo platiti bez komplikacija
- ne želi obaveznu registraciju (gdje god je moguće)
- mora imati jasan osjećaj sigurnosti
- mora jasno vidjeti iznos i kome plaća

---

## Key Value Proposition

### Za merchant-a
- naplata putem QR i NFC bez POS uređaja
- niži troškovi kroz alternativne modele plaćanja
- jednostavno generisanje payment session-a
- jasan pregled uplata

### Za customer-a
- brzo plaćanje (scan ili tap)
- nema nepotrebnih koraka
- jasan i razumljiv flow
- mogućnost korištenja postojećeg kredita (balance)

---

## Payment Methods (MVP)

U MVP fazi podržavamo:

### 1. Kartično plaćanje
- standardni IPG flow
- jednokratna uplata

### 2. Balance / Gift Credit
Interni kredit koji korisnik može koristiti za plaćanje.

Balance se može dopuniti na dva načina:

- kartičnim plaćanjem (top-up)
- uplatom putem:
  - mobilnog bankarstva
  - uplatnice / naloga u banci

Napomena:

Balance / gift credit je korisnički razumljiv koncept (kredit/sredstva), dok tehnička implementacija i bankarski tokovi nisu izloženi korisniku.

---

## MVP Scope (Phase 1)

### Payment initiation
- QR-based payment
- NFC-based payment
- payment link (fallback)

### Payments
- public payment page (web)
- izbor metode plaćanja (kartica / balance)
- success ekran
- fail ekran

### Merchant
- onboarding (osnovni podaci firme + račun)
- osnovni dashboard
- pregled transakcija

### Balance (basic)
- prikaz dostupnog kredita (ako postoji)
- osnovni top-up flow (kartica + uplata)

---

## Out of Scope (NOT in MVP)

- refund mehanizam
- loyalty / nagrade (van osnovnog balance koncepta)
- advanced analytics
- multi-user roles i permissions
- kompleksni reporting

---

## UX Principles

- maksimalno 2–3 koraka do plaćanja
- nema login-a za customer-a (gdje je moguće)
- mobile-first pristup
- isti UX bez obzira na ulaz:
  - QR
  - NFC
  - link
- instant otvaranje payment page-a
- jasan prikaz:
  - merchant name
  - amount
  - status (success / fail)
- fokus na trust (bank-level osjećaj)

---

## UX Terminology Rules

- ne koristiti tehničke termine (npr. A2A, tokenizacija)
- koristiti jednostavne izraze:
  - "Plati karticom"
  - "Koristi kredit" 
- izbjegavati sve što može zbuniti korisnika
- terminologija mora biti konzistentna kroz cijeli proizvod

---

## Payment Entry Points

User može ući u flow na tri načina:

1. QR scan
2. NFC tap
3. Direct payment link (merchant share link)

Nakon ulaska, iskustvo mora biti identično.

---

## Technical Assumptions (high level)

- QR i NFC vode na web payment page
- nije potrebna instalacija aplikacije za customer-a
- backend je API-driven
- payment session ima status:
  - pending
  - success
  - failed
- integracija sa bankom / IPG za kartice
- balance sistem vodi interno stanje korisničkog kredita

---

## Success Criteria (MVP)

- merchant može kreirati payment i naplatiti
- customer može završiti plaćanje bez konfuzije
- UX je dovoljno jasan bez dodatnog objašnjenja
- podržana su oba načina:
  - kartica
  - balance
- flow radi stabilno bez blokera