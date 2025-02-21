# Instalacja narzędzi:  
```
sudo apt update
sudo apt install ffmpeg  
sudo apt install pipx  
pipx install -U yt-dlp
```
# Wymagane pliki:
W katalogu w którym mają zostać zapisane filmy wymagane są trzy plik.  
1. Plik download.sh zawierający skrypt
2. Plik cookies.txt z pobranymi wcześniej z przeglądarki ciasteczkami, musisz zalogować się wcześniej na YT i zapisać dane logowania w cookies żeby skrypt mógł je wykorzystać do pobierania filmów
3. Plik links.txt zawierający linki do filmów, przy czym każdy w nowej lini

# Obsługa:
- Umieść wszystkie pliki w jednym katalogu
- nadaj skryptowi odpowiednie uprawnienia `chmod +x download.sh`
- Uruchom skrypt poleceniem `./download.sh`
- Jeśli chcesz pobrać tylko jeden film i nie chce ci się grzebać w plikach możesz użyć argumentu `-l` i po nim podać adres URL do materiału np. `./download.sh -l https://www.youtube.com/watch?v=dQw4w9WgXcQ`
- Jeżeli potrzebujesz hurtowo pobrać całą playlistę to zamiast zapisywać linki do wszystkich flimów w pliku możesz użyć argumentu `-p` i podać URL do playlisty, przykładowo: `./download.sh -p https://www.youtube.com/playlist?list=PLOYHgt8dIdozjwTQRGh9mvLDZ2TCAgDh3`
