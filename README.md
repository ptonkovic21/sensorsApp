Aplikacija bi trebala raditi u trenutnom stanju ali bez senzora temperature
Svi trenutni omoguceni senzori se koriste preko sensors_plus package-a, no on ima samo 4 senzora na raspolaganju, dokumentacija za package se nalazi na sljedecem linku:
[https://pub.dev/packages/sensors_plus](https://pub.dev/packages/sensors_plus)

za ostale senzore potrebno je koristiti druge package-e poput environment_sensors, u mom slucaju sam njega koristio jer nudi druge razne senzore. Dokumentacija:
[https://pub.dev/packages/environment_sensors/example](https://pub.dev/packages/environment_sensors)

Problem

Kako bi vidjeli problem s kojim se patim trebate naparviti par koraka

1. instalirati environment_sensors
   izvrsite ovu komandu u terminalu:
   "flutter pub add environment_sensors"
   ili dodajte: "environment_sensors: ^0.3.0" pod dependecies u "pubspec.ymal" file-u i stisnte na "pub get"

3. otkomentirajte zakomentirani kod u main.dart (gumb koji vodi na temperature_screen) i import za tempreature screen

4. pokrenite aplikaciju

slika errora
![image](https://github.com/user-attachments/assets/16e379f2-7ac1-481b-8965-573e58463c5b)
