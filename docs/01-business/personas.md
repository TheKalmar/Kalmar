# Personas

Ovaj dokument definiše glavne korisnike kalmar sistema.

Fokus je na:
- kontekstu korištenja
- ciljevima
- frustracijama
- ponašanju

Ovdje NE definišemo korake (flows), već razumijevanje korisnika.

---

## Persona 1: Merchant (Trgovac)

### Profil
- radnici za kasom iz malih i srednjih biznisi
- kafići, restorani, saloni, mali retail
- često bez napredne tehničke infrastrukture

### Ciljevi
- brzo i jednostavno naplatiti
- izbjeći komplikovane POS uređaje
- imati pregled uplata
- smanjiti troškove

### Frustracije
- skupi POS terminali
- spor checkout
- komplikovan onboarding kod banaka
- nejasan pregled uplata

### Potrebe
- jednostavan onboarding
- pouzdan sistem naplate
- jasan pregled transakcija
- minimalna tehnička kompleksnost

### Kontekst korištenja
- fizička lokacija (kasa, stol, šalter)
- direktna interakcija sa kupcem
- očekuje da sve radi brzo i bez zastoja

---

## Persona 2: Merchant (Napredni korisnik/Manager/Owner)

### Profil
- koristi kalmar redovno 
- imaće dodatne slojeve upravljanja (loyalty, profil management...)
- oslanja se na dashboard

### Ciljevi
- imati pregled poslovanja
- definisati role radnika unutar poslovnice
- brzo pronaći transakcije
- pratiti promet

### Frustracije
- neorganizovani dashboardi
- nedostatak filtera
- sporo učitavanje podataka

### Potrebe
- jasan dashboard
- lista transakcija
- pregled konobara
- osnovni filteri i pregled
- pouzdan sistem bez grešaka

### Kontekst korištenja
- koristi sistem svakodnevno
- očekuje stabilnost i brzinu
- donosi odluke na osnovu prikazanih podataka

---

## Persona 3: Customer (Kupac – bez kredita)

### Profil
- koristi mobilni telefon za plaćanja
- nije nužno tehnički napredan
- ne želi instalirati dodatne aplikacije

### Ciljevi
- platiti brzo i bez komplikacija
- završiti proces u što manje koraka
- imati osjećaj sigurnosti

### Frustracije
- previše koraka kod plaćanja
- nejasni ili nepouzdani payment ekrani
- traženje registracije bez potrebe

### Potrebe
- jasan prikaz:
  - iznosa
  - trgovca
- jednostavan izbor plaćanja
- brz i predvidiv proces

### Kontekst korištenja
- stoji na kasi ili u redu
- želi završiti plaćanje što prije
- ne želi razmišljati o tehnologiji iza sistema

---

## Persona 4: Customer (Kupac – sa Kalmar Credit)

### Profil
- već koristio kalmar
- ima dostupan kredit (balance)
- vraća se ponovo koristiti sistem

### Ciljevi
- platiti što brže koristeći postojeći kredit
- izbjeći ponovno unošenje kartice
- imati osjećaj kontrole nad svojim sredstvima
- želi druge pogodnosti kalmar sistema poput KalmarLoyalty

### Frustracije
- mora koristiti karticu iako ima kredit
- ne vidi jasno koliko kredita ima
- nejasno ponašanje sistema pri plaćanju

### Potrebe
- jasan prikaz dostupnog kredita
- jednostavna opcija korištenja kredita
- brz checkout (minimalni broj akcija)

### Kontekst korištenja
- već poznaje sistem
- očekuje brže iskustvo nego prvi put
- koristi kalmar kao “poznat i pouzdan alat”


---

## Ključni UX zaključci

- sistem mora raditi za:
  - nove korisnike (bez kredita)
  - postojeće korisnike (sa kreditom)

- UX mora:
  - minimizirati broj koraka
  - biti jasan bez objašnjenja
  - graditi povjerenje

- isti osnovni flow bez obzira na ulaz:
  - QR
  - NFC
  - link

- kredit (balance) treba:
  - biti jasno vidljiv
  - biti jednostavan za korištenje
  - ubrzavati checkout za postojeće korisnike