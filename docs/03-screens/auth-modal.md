# Screen: Autentifikacija (Auth Modal)

## Purpose

Potvrditi identitet korisnika prije izvršenja osjetljive akcije (plaćanje), kada je to potrebno.

Autentifikacija se prikazuje samo u određenim situacijama i ne smije biti default korak.

---

## Trigger

Autentifikacija se prikazuje kada:

- korisnik koristi sačuvanu karticu (u određenim slučajevima)
- korisnik koristi Kalmar Gift / Credit
- transakcija prelazi određeni iznos
- uređaj nije prepoznat
- sistem detektuje povećan rizik

---

## Layout Structure

Modal (ili full screen na mobilnim uređajima) sa fokusom na jednu akciju.

### 1. Naslov

- "Potvrdite identitet"
ili
- "Potrebna dodatna potvrda"

---

### 2. Objašnjenje

Kratko i jasno:

- "Radi vaše sigurnosti, potrebno je da potvrdite identitet."

Bez tehničkih detalja.

---

### 3. Metoda autentifikacije

Prikazuje se jedna od sljedećih metoda:

---

## Autentifikacione metode

### 1. PIN

#### Elementi:
- input za unos PIN-a (4–6 cifara)
- maskiran unos

#### CTA:
- "Potvrdi"

---

### 2. Jednokratni kod (OTP)

#### Elementi:
- input za kod
- informacija gdje je poslan kod (npr. email ili SMS)

#### CTA:
- "Potvrdi"

#### Sekundarno:
- "Pošalji ponovo"

---

### 3. Biometrija / uređaj

#### Elementi:
- sistemski prompt (npr. Face ID / fingerprint)
- bez dodatnih inputa

---

## States

### Initial
- prikazan modal
- user treba izvršiti autentifikaciju

---

### Loading
- nakon unosa / potvrde
- prikaz loading indikatora

---

### Success
- modal se zatvara
- user se vraća na checkout flow

---

### Failed

- pogrešan PIN / kod
- prikaz kratke poruke:
  - "Neispravan kod"
  - "Pokušajte ponovo"

---

### Blocked

- previše pokušaja
- prikaz poruke:
  - "Previše neuspjelih pokušaja. Pokušajte kasnije."

---

## UX Requirements

- fokus na jednoj akciji (nema distrakcija)
- jasno zašto se traži potvrda
- minimalan broj koraka
- brzina (mora djelovati instant)

---

## UI Requirements

- modal mora biti jasan i centriran
- input polje mora biti dominantno
- CTA ("Potvrdi") mora biti jasan
- greške moraju biti diskretne, ali vidljive

---

## Behavior Rules

- autentifikacija blokira nastavak plaćanja dok se ne završi
- nakon uspjeha → vraća se na checkout bez resetovanja
- nakon greške → omogućiti ponovni pokušaj

---

## Copy Guidelines

Koristiti jednostavan i razumljiv jezik:

✔ "Potvrdite identitet"  
✔ "Unesite kod"  
✔ "Pokušajte ponovo"  

Izbjegavati:

✘ tehničke termine  
✘ duge rečenice  
✘ objašnjenja koja zbunjuju  

---

## Notes for UI/UX

- ovo je security moment, ali ne smije izgledati zastrašujuće
- cilj je:
  - sigurnost
  - brzina
  - jasnoća

- korisnik mora imati osjećaj:
  - kontrole
  - povjerenja

---

## Open Questions

- da li PIN postaje primarna metoda za Kalmar Credit
- kada nuditi OTP fallback
- da li omogućiti "zapamti uređaj" opciju