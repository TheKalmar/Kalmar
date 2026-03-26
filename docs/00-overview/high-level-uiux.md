# Screen Map

Ovaj dokument definiše sve ključne ekrane u Kalmar sistemu.

Cilj:
- imati jasan pregled cijelog proizvoda
- uskladiti product, UI/UX i development
- izbjeći propuštene ekrane i funkcionalnosti

---

# 1. CUSTOMER (Checkout)

Ulaz:
- QR
- NFC
- direct link

Nakon ulaska, svi entry point-ovi vode u isti checkout flow.

---

## 1.1 Core Checkout Screens

### Payment Page
Glavni checkout ekran:
- merchant name
- opcionalna poruka
- amount
- payment methods:
  - saved card (ukljucujuci Kalmar Gift)
  - new card


Napomena:
Kalmar Gift se prikazuje kao metoda plaćanja u istoj listi i u istom vizuelnom stilu kao kartice.

---

### Authentication (Conditional)
Prikazuje se samo kada je potrebna dodatna potvrda:
- PIN
- OTP
- biometrics / passkey

---

### Processing
Stanje nakon potvrde plaćanja:
- obrada u toku
- onemogućene dodatne akcije

---

### Payment Success
Potvrda uspješne transakcije:
- success poruka
- summary
- otvara receipt automatski

---

### Payment Failed / Delayed
Neuspjela ili odgođena transakcija:
- error / delayed poruka
- retry
- promjena metode plaćanja

---

### Receipt (Slip)
Detaljan prikaz transakcije:
- merchant
- amount
- datum i vrijeme
- transaction ID
- share / print

---

## 1.2 Supporting Screens

### Loading (Session Load)
### Invalid Link / QR
### Expired Session
### Network Error

---

## 1.3 Payment Method Related

### Add New Card
- unos kartice

---

### Save Card (Flow)
- opcija spremanja kartice
- zahtijeva autentifikaciju

---

### Kalmar Gift State
- prikaz kao kartica
- prikaz dostupnog iznosa
- stanje kada nema dovoljno sredstava

---

## 1.4 Kalmar Gift / Top-Up

Top-up omogućava korisniku da dopuni Kalmar Gift (kredit).

Nije dio osnovnog checkout flow-a, ali mora biti lako dostupan.

---

### Top-Up Entry

Top-up se može pokrenuti iz:
- Payment Page (ako nema dovoljno sredstava)
- Receipt (opciono)
- direktnog linka (future)

---

### Top-Up Amount Selection

- predefined iznosi (npr. 20, 50, 100 KM)
- opcija unosa custom iznosa

---

### Top-Up Payment Method

Izbor metode:
- kartica
- uplata (bank transfer / uplatnica)

---

### Card Top-Up Flow

- izbor kartice ili unos nove
- potvrda
- processing

---

### Bank Transfer / Uplatnica

Prikaz podataka za uplatu:
- račun
- poziv na broj / referenca
- instrukcije za:
  - mobilno bankarstvo
  - uplatu u banci

---

### Top-Up Processing
- čekanje potvrde

---

### Top-Up Success
- potvrda dopune
- prikaz novog balansa

---

### Top-Up Failed
- greška
- retry

---

## 1.5 Customer Summary

Minimalni MVP:

- Payment Page
- Authentication (conditional)
- Processing
- Payment Success
- Payment Failed / Delayed
- Receipt
- Top-Up flow (basic)
- Edge cases



---

# 2 CUSTOMER Merchant Flow

## Purpose

Definisati kompletan tok za prodavca (merchant-a):

- od registracije
- do svakodnevnog korištenja sistema
- do upravljanja transakcijama i timom

---

# 1. Onboarding Flow (Prvi ulazak)

## Step 1: Registration

Merchant kreira nalog:

- telefon + sms 
- osnovni pristup sistemu

---

## Step 2: Login

Merchant se prijavljuje u sistem.

---

## Step 3: Register Business / Store

Merchant registruje svoj poslovni subjekt:

1. Naziv firme
2. Sjedište (adresa, poštanski broj, mjesto)
3. JIB
4. MBS
5. Zastupnik (sa nazivom pozicije)
6. Email za komunikaciju u vezi Ugovora
7. Adresa na koju dostavljamo Ugovor, poštanski broj, mjesto
8. Tekući račun na koji želite da Vam liježe novac od svake prodaje na kalmaru.

---

## Step 4: Business Activated

Nakon uspješne registracije:

- merchant dobija pristup dashboard-u

---

# 2. Daily Usage Flow (Glavni tok)

Ovo je primarni način korištenja sistema.

---

## Step 1: Open Dashboard

Merchant ulazi u sistem i vidi:

- pregled zadnjih transakcija
- opciju za novu transakciju

---

## Step 2: Start New Transaction

Merchant pokreće novu naplatu:

→ klik na "Nova transakcija"

---

## Step 3: Enter Transaction Data

Merchant unosi:

- amount
- opcionalnu poruku

---

## Step 4: Generate Payment

Sistem generiše:

- QR kod
- NFC ready signal
- payment link

---

## Step 5: Present to Customer

Merchant može:

- pokazati QR kod
- koristiti NFC (tap)
- poslati link (share)

---

## Step 6: Wait for Payment

Merchant vidi status:

- pending
- processing

---

## Step 7: Payment Outcome

### Success
- transakcija uspješna

### Failed / Delayed
- nije prošla ili čeka

---

## Step 8: Immediate Revert (ako treba)

Ako transakcija još nije procesuirana:

→ merchant može uraditi **revert**

---

# 3. Transaction Management Flow

---

## Step 1: Open Historical Payments

Merchant otvara listu svih transakcija.

---

## Step 2: View Transaction List

Lista sadrži:

- amount
- status
- datum
- osnovne informacije

---

## Step 3: Open Transaction Details

Merchant otvara detalje jedne transakcije.

---

## Step 4: Perform Refund

Ako je dozvoljeno:

→ merchant može izvršiti **refund**

---

# 4. Team Management Flow

---

## Step 1: Open Users List

Merchant vidi sve korisnike:

- cashier
- manager
- admin

---

## Step 2: Add User

Merchant dodaje novog korisnika:

- dodjela pristupa

---

## Step 3: Remove User

Merchant uklanja korisnika iz sistema.

---

# 5. Reporting Flow

---

## Step 1: Open Reports / Export

Merchant bira period:

- danas
- zadnja 3 dana
- zadnjih 7 dana
- prethodni mjesec

---

## Step 2: Export PDF

Sistem generiše:

- PDF pregled transakcija

---

# 6. Key States

## Transaction States

- pending
- processing
- success
- failed
- delayed
- reverted
- refunded

---

# 7. Key Actions

Merchant mora imati pristup:

- nova transakcija
- prikaz QR / NFC / link
- revert (dok nije procesuirano)
- refund (iz historije)
- pregled transakcija
- export podataka
- upravljanje korisnicima

---

# 8. UX Principles

- sve mora biti brzo dostupno sa dashboard-a
- minimalan broj koraka za kreiranje transakcije
- jasan status transakcije
- bez komplikovanih menija

---

# 9. MVP Scope

Minimalni merchant MVP uključuje:

- login
- registraciju
- registraciju business-a
- dashboard
- create transaction flow
- QR / NFC / share
- success / failed
- revert
- refund
- historical payments
- export PDF
- user management
