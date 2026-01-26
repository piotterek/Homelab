# Pobieranie dostępnych hostów

Żądanie **GET** ```http://10.0.0.201:5678/webhook/hosts```

Zwraca listę obiektów w formacie JSON, zawierającą parametry:
- id - id elementu w bazie danych
- name - przyjazna nazwa hosta
- mac - adres MAC hosta

Przykład odpowiedzi:
[
  {
    "id": 4,
    "name": "drukarka",
    "mac": "aa:bb:cc:dd:ee:ff"
  },
  {
    "id": 7,
    "name": "pc",
    "mac": "11:22:33:44:55:66"
  }
]

---

# Dodawanie nowego hosta do bazy

Żądanie **POST** ```http://10.0.0.201:5678/webhook/add```
z parametrami body:
- name - przyjazna nazwa dodawanego hosta
- mac - adres MAC dodawanego hosta

Zwraca:
[
  {
    "status": "success",
    "message": "Host added"
  }
]

---
 
# Usuwanie hosta z bazy

Żądanie **DELETE** ```http://10.0.0.201:5678/webhook/000a2553-53d8-4246-89c1-a39cfc7098a6/delete/{id}```
w URL należy podać id hosta, którego chce się usunąć

Zwaraca:
[
  {
    "status": "success",
    "message": "Host deleted"
  }
]

---

# Wysyłanie magic packet

Żądanie **POST** ```http://10.0.0.201:5678/webhook/f952a5a1-208b-4414-8c75-ba6ee7670e15/send/{id}```
w URL należy podać id hosta, do którego chce się wysłać magic packet

Przykładowa odpowiedź:
[
  {
    "status": "success",
    "message": "Sent magic packet to 11:aa:22:bb:33:cc"
  }
]

---
