Todo list application
=====================

Zadanie 1
---------
Utwórz aplikację wyświetlającą listę zadań do wykonania:
  - listę zadań zapisz w sesji użytkownika (jako rozwiązanie tymczasowe przed implementacją DB)
  - formularz dodawania nowego zadania oraz lista zadań powinny znajdować się na tej samej stronie
  - zadanie składa się z następujących wartości:
    - treść zadania
    - termin wykonania zadania
    - priorytet

Zadanie 2
---------
Dodaj następujące funkcjonalności:
  - usuwanie poszczególnych pozycji z listy
  - możliwość sortowania wg kolejności dodania lub daty lub priorytetu, kolejność sortowania rosnąco/malejąco

Zadanie 3
---------
Tytuł aplikacji składający się z dwóch słów zapisz w plikach properties. Wyświetl ten tytuł w taki sposób aby tylko pierwsze słowo było pogrubione (przykład: **todo** list)

Zadanie 4
---------
Używając Bootstrapa opracuj atrakcyjny wygląd aplikacji

Zadanie 5
---------
Zabezpiecz aplikację przed dodawaniem kolejnego zadania po odświeżeniu strony na której zostało dodane zadanie z formularza

Zadanie 6
---------
W przypadku braku zadań wyświetl stosowną informację.
Wyświetl komunikat o błędzie w przypadku próby dodania zadania o niedozwolonej treści. (np. pusty tekst)

Zadanie 7
---------
Dodaj obsługę języka angielskiego, niemieckiego, polskiego
  - dodaj przyciski które pozwalają zmienić język
  - zapamiętaj preferencję językową użytkownika. Ustawiony język powinien być od razu aktywny po powrocie na stronę aplikacji​

Zadanie 8
---------
Przenieś logikę aplikacji ze skryptletów do serwletów. Funkcjonalność serwletów jest następująca:
  - ustawienie preferencji językowych
  - CRUD dla zadań
  
Użyj wzorca Model-View-Controller​

Zadanie 9
----------
Dodaj możliwość edycji zadania do wykonania​

Zadanie 10
---------
Dodaj warstwę utrwalania w bazie danych (Hibernate/JPA)​