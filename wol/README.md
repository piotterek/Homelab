# Wake on LAN system

Lekki system do zdalnego zarządzania zasilaniem urządzeń w sieci lokalnej, wykorzystujący **n8n** jako silnik backendowy i orkiestrator zapytań do bazy **MySQL**.

## Architektura systemu

1. Client: prosta aplikacja komunikująca się z Rest API.

   👉[Gotowa aplikacja webowa](index.html).
---
2. Logic (n8n):
- Endpointy REST (GET/POST/DELETE).
- Logika walidacji i pobierania danych z DB.
- Wysyłanie pakietów UDP (Magic Packet).

  👉[Workflow n8n](workflow.json)

  👉[Dokumentacja Rest API](api_docs.md) (jeśli chcesz zbudować swojego klienta).
---
3. Storage (MySQL): Przechowuje definicje hostów.

   👉[Plik .sql z bazą danych](mac.sql)
---
## Szybka konfiguracja

- Zaimportuj tabelę z pliku ```mac.sql``` do swojej bazy MySQL.
- Wgraj ```workflow.json``` do n8n i skonfiguruj MySQL Credentials.
- W pliku ```index.html``` (lub pliku swojego klienta) podaj adres URL odpowiedniego webhooka n8n.
