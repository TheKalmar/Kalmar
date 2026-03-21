# Payment Checkout Flow

## Goal

Omogućiti customer-u da brzo, jasno i sigurno izvrši plaćanje koristeći Kalmar.

Flow mora biti:
- brz (minimalan broj koraka)
- jasan (bez konfuzije)
- konzistentan (bez obzira na način ulaska)

---

## Entry Points

User može ući u checkout na tri načina:

### 1. QR
- user skenira QR kod
- otvara se payment link

### 2. NFC
- user prislanja telefon na NFC
- otvara se payment link

### 3. Direct Link
- user otvara link iz poruke / weba

Nakon ulaska, svi entry point-ovi vode u isti checkout flow.

---

## Actor

Customer

---

## Main Flow

1. User otvara payment page (preko QR / NFC / link)
2. Sistem učitava payment session
3. User vidi:
   - merchant name
   - opcionalna poruka (ako je popunjena)
   - amount
4. User bira način plaćanja:
   - saved card (ako postoji)
   - new card
   - Kalmar Gift / Credit (ako postoji)
5. Ako je potrebna dodatna autentifikacija, sistem traži potvrdu korisnika
6. User potvrđuje plaćanje
7. Sistem obrađuje transakciju
8. User vidi rezultat:
   - success
   - failed
9. Ako je success:
   - user ima opciju da:
     - pregleda slip (receipt)
     - podijeli slip
     - isprinta slip

---

## Conditional Authentication

Dodatna autentifikacija se prikazuje samo kada je potrebna.

Zavisi od:
- tipa korisnika (guest / logged)
- metode plaćanja
- iznosa
- povjerenja uređaja
- rizika

Autentifikacija može uključivati:
- potvrdu identiteta (login)
- PIN
- OTP
- biometrics / passkey

Napomena:
- guest user ne prolazi Kalmar autentifikaciju za kartično plaćanje
- kartični procesor i banka mogu zahtijevati dodatnu autentifikaciju (npr. 3DS)

---

## Payment Methods

### Saved Card
- prikazuje se ako user ima sačuvane kartice
- omogućava najbrži checkout
- prikazuje masked karticu (npr. **** 4242)

### New Card
- user unosi novu karticu
- koristi se standardni kartični flow

### Kalmar Gift / Credit
- prikazuje se ako user ima raspoloživ kredit
- koristi se kao alternativa kartici
- mora jasno prikazati dostupan iznos

---

## System States

### Loading
- učitavanje payment session-a
- prikaz loading indikatora

### Ready
- prikaz merchant-a i iznosa
- omogućeno biranje metode plaćanja

### Authentication Required
- prikazuje se samo ako je potrebna dodatna potvrda
- blokira dalji nastavak dok user ne potvrdi identitet

### Processing
- nakon potvrde plaćanja
- onemogućene dodatne akcije

### Success
- jasno prikazan uspjeh
- prikazan:
  - merchant name
  - amount
  - potvrda plaćanja

### Failed
- prikazana greška
- omogućena ponovna akcija (retry)

---

## Receipt (Slip)

Nakon uspješnog plaćanja, korisniku se prikazuje digitalni slip (receipt).

Slip mora sadržavati:

- merchant name
- amount
- datum i vrijeme
- reference / transaction ID
- status (successful)

---

### Receipt Actions

User može:

- otvoriti slip (view)
- podijeliti (share)
- isprintati (print)

---

### UX Requirements (Receipt)

- slip mora biti jednostavan i čitljiv
- optimizovan za mobile i print
- mora izgledati kao validan dokaz o plaćanju
- mora biti dostupan odmah nakon success ekrana

---

## Edge Cases

### Invalid Link / QR
- payment session ne postoji
- prikaz error poruke

### Expired Session
- session istekao
- prikaz poruke + opcija za novi pokušaj

### Payment Failed
- transakcija nije prošla
- prikaz poruke
- omogućiti retry

### User Exit
- user napušta stranicu prije završetka

---

## UX Requirements

- maksimalno 2–3 koraka do plaćanja
- nema obavezne registracije za customer-a
- mobile-first dizajn
- jasan i prominentan CTA
- minimalno distrakcija
- autentifikacija samo kada je potrebna (ne default)

---

## UI Requirements

- merchant name mora biti jasno vidljiv
- amount mora biti dominantan element
- payment methods moraju biti jasno odvojene
- success i fail state moraju biti nedvosmisleni
- stanje autentifikacije mora biti jasno i fokusirano

---

## Consistency Requirements

- isti flow mora važiti za:
  - QR
  - NFC
  - link

Razlika postoji samo u entry point-u, ne u iskustvu.

---

## Exit Conditions

Flow se završava kada:

- payment success → prikazan success ekran
ili
- payment failed → prikazan fail ekran