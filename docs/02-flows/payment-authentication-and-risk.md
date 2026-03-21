# Payment Authentication and Risk Flow

## Purpose

Definisati kada i kako Kalmar traži dodatnu autentifikaciju tokom checkout-a.

Cilj je:

- minimizirati frikciju gdje je moguće
- povećati sigurnost gdje je potrebno
- ne duplicirati zaštitu koju već radi banka (npr. 3DS)

---

## Scope

Ovaj dokument definiše:

- kada se traži autentifikacija
- koje metode se koriste
- kako se ponaša sistem u različitim scenarijima

Ne definiše UI (to je u auth-modal.md), ali definiše ponašanje koje UI mora podržati.

---

## Inputs

Sistem donosi odluke na osnovu:

- user type:
  - guest
  - logged user

- payment method:
  - new_card
  - saved_card
  - kalmar_credit

- amount

- device trust:
  - known
  - unknown

- risk level:
  - low
  - medium
  - high

---

## Core Principles

### 1. Ne duplirati banku
Ako banka već radi autentifikaciju (npr. 3DS), Kalmar ne dodaje dodatni korak bez potrebe.

---

### 2. Friction samo kad treba
Autentifikacija se prikazuje samo kada postoji razlog.

---

### 3. Veća kontrola nad Kalmar Credit
Za Kalmar Credit Kalmar snosi odgovornost → uvijek postoji određeni nivo autentifikacije.

---

### 4. Jedinstven UX za metode plaćanja

Sve metode plaćanja se u UI-u prikazuju kao jedinstvena lista (kao kartice).

Kalmar Gift / Credit:

- izgleda kao saved card
- selektuje se kao saved card
- ali se tretira kao poseban payment method u backend-u

---

## Decision Flow

---

### 1. Guest User

Guest user može koristiti samo novu karticu.

Flow:

- redirect na IPG
- banka odlučuje o 3DS

Kalmar ne traži:
- login
- PIN
- dodatnu autentifikaciju

---

### 2. Logged User

Logged user može koristiti:

- new card
- saved card
- Kalmar Credit (prikazan kao “Kalmar Gift” u UI)

---

## Payment Method Rules

---

### A. New Card

- user unosi karticu
- IPG obrađuje plaćanje
- 3DS ako banka zahtijeva

Ako user želi sačuvati karticu:

- zahtijeva dodatnu autentifikaciju:
  - primarno: biometrics / passkey
  - fallback: OTP

---

### B. Saved Card

#### Low Risk

Ako je:

- device = known
- risk = low
- amount ispod threshold-a

→ nema dodatne autentifikacije  
→ ide direktno na IPG (3DS ako treba)

---

#### Medium Risk

Ako je:

- risk = medium
- ili amount iznad threshold-a

→ traži se dodatna autentifikacija:
- biometrics / passkey
- fallback: OTP

---

#### High Risk

Ako je risk = high:

→ obavezna autentifikacija:
- biometrics (prioritet)
- fallback: OTP

---

#### Suggested Threshold

- 50–100 KM (MVP)

---

### C. Kalmar Credit / Gift

Napomena:

U UI-u se Kalmar Credit prikazuje kao “Kalmar Gift” i ima isti vizuelni oblik kao saved card, ali:

👉 sigurnosno se tretira kao poseban payment method

---

#### Low Risk / Small Amount

Ako je:

- amount mali
- device = known

→ zahtijeva PIN

---

#### Medium / Unknown Device

Ako je:

- veći iznos
- ili device unknown

→ zahtijeva:
- biometrics / passkey
- ili PIN + OTP

---

#### High Risk

Ako je risk = high:

→ zahtijeva:
- biometrics kao primarni metod

---

#### Suggested Threshold

- 20–50 KM (MVP)

---

## Device Trust

Ako korisnik uspješno prođe biometrics:

→ uređaj se može označiti kao trusted

Trusted uređaj omogućava:

- manje autentifikacije u low-risk situacijama

---

## Sensitive Actions (Van Checkout-a)

Uvijek zahtijevaju autentifikaciju:

- dodavanje kartice
- brisanje kartice
- promjena email-a
- promjena lozinke
- promjena sigurnosnih postavki

---

## Risk Signals (MVP)

### High Risk
- novi uređaj
- nova lokacija / IP
- više neuspjelih pokušaja
- visok iznos

---

### Medium Risk
- novi browser
- dugo vremena od zadnje aktivnosti

---

### Low Risk
- poznat uređaj
- uobičajeno ponašanje

---

## UX Implications

- sve metode plaćanja izgledaju isto u UI-u
- razlika u sigurnosti nije vidljiva korisniku
- autentifikacija se prikazuje samo kada je potrebna
- Kalmar Credit ima strožija pravila, ali bez komplikovanja UX-a
- poruke moraju biti kratke i razumljive

---

## Open Questions

- da li PIN ostaje obavezan za svaki Kalmar Credit payment
- da li threshold ostaje fiksan ili dinamički
- kako tretirati fallback ako biometrics nije dostupan
- da li guest user ikada može koristiti Kalmar Credit