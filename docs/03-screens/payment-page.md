# Screen: Payment Page

## Purpose

Omogućiti user-u da:

- vidi kome i koliko plaća
- izabere način plaćanja
- izvrši plaćanje uz minimalan broj koraka

Ovo je centralni ekran checkout-a.

---

## Layout Structure

Ekran je podijeljen u 3 glavna dijela:

### 1. Header (Trust + Context)

Sadrži:

- merchant name (obavezno)
- opcionalna poruka (ako postoji)
- indikator sigurnosti (npr. "Secure payment","NLB")

---

### 2. Payment Details

Sadrži:

- amount (najdominantniji element na ekranu)
- valuta
- eventualni dodatni opis (opcionalno)

---

### 3. Payment Methods

Lista dostupnih metoda plaćanja:

- saved cards (ako postoje(ako je korisnik ulogovan))
- new card (uvijek dostupno)
- Kalmar Gift / Credit (ako korisnik ima dovoljno kredita da plati putem kalmar gifta Kalmar gift kartica bi trebala biti u saved karticama da se olakša korisnicima...)

---

### 4. Primary Action

- glavni CTA (npr. "Plati", "Nastavi")
- uvijek vidljiv i jasan

---

## Elements

### Merchant Info
- Ime prodavača (firme)
- opcionalna poruka

### Amount
- velik i jasno istaknut
- uvijek vidljiv bez scroll-a

### Payment Methods List

Svaka metoda mora biti prikazana kao selectable item:

#### Saved Card
- masked broj (**** 4242)
- brand (Visa / MasterCard / Gift)
- može biti više opcija

#### New Card
- opcija za unos nove kartice

---

### CTA (Primary Button)

- tekst:
  - "Plati"
- stanje:
  - disabled dok nije odabrana metoda
  - loading tokom processing

---

## States

### Loading
- skeleton ili spinner
- blokiran UI

---

### Ready
- svi podaci prikazani
- user može izabrati metodu

---

### Method Selected
- jasno označena aktivna metoda
- CTA aktivan

---

### Authentication Required
- prikazuje se kada je potrebna dodatna potvrda
- može biti:
  - modal
  - full screen (mobile)
- blokira dalje akcije dok se ne završi

---

### Processing
- prikaz loading stanja
- disable svih inputa
- jasno da je u toku obrada

---

### Success
- redirect ili prikaz success ekrana

---

### Failed
- prikaz greške
- omogućiti retry

---

## UX Requirements

- maksimalno 2–3 koraka do plaćanja
- nema obavezne registracije za guest user-a
- mobile-first dizajn
- jasan fokus na:
  - amount
  - merchant
  - CTA
- minimalno distrakcija

---

## Payment Methods UX Rules

- samo dostupne metode se prikazuju
- Kalmar Gift se prikazuje samo ako postoji kredit
- saved cards imaju prioritet (brži izbor)
- new card uvijek mora biti dostupna

---

## Authentication UX

- prikazuje se samo kada je potrebno
- mora biti:
  - brzo
  - jasno
  - fokusirano
- ne smije zbuniti user-a

---

## Error Handling

- greške moraju biti:
  - jasne
  - kratke
- bez tehničkih termina
- uvijek ponuditi sljedeći korak (retry)

---

## Accessibility

- dovoljno veliki CTA
- jasan kontrast
- čitljiv font
- jednostavna navigacija

---

## Notes for UI/UX

- ovo je ekran gdje user odlučuje da li vjeruje sistemu
- dizajn mora izgledati:
  - sigurno
  - profesionalno
  - jednostavno

- izbjegavati:
  - clutter
  - nepotrebne informacije
  - kompleksne opcije

---

## Open Questions

- da li je default selektovana metoda:
  - saved card
  - ili ništa

- kako prikazati nedovoljan Kalmar Credit

- da li dozvoliti kombinaciju:
  - credit + card (future feature)