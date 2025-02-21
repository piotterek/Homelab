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
