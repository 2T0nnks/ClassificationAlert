# Alert classification

### steps

* git clone https://github.com/2T0nnks/ClassificationAlert.git
* need python 3.12
* need docker
* pip install -r requirements.txt
* docker compose up -d // sudo docker-compose up -d
* python main.py

### or use an installation script

* ./setup.sh for linux 
* ./setup.bat for windows 

---
### Use

- Install the requirements
- Start docker
- python3 app.py or run via pycharm / vscode



Access the mailhog url to check the application is working.

 ### Urls:
    
    http://0.0.0.0:8025/
    or
    http://127.0.0.1:8025/

    --> "http://localhost:8025"

### Url of pgadmin for administrate db

    http://127.0.0.1:8281/

login --> admin@root.com
pass -->  admin

password for myuser --> secret

---
### obs

La aplicación genera un usuario falso y datos de marketing como bases de datos. En la entrada de datos de la carpeta y el resultado están los archivos json y csv generados por la aplicación.

En este desafío busqué cumplir el objetivo principal y las tareas extra.
Creé la aplicación según mi comprensión del desafío.


El mayor desafío fue buscar las mejores prácticas de código y hacer que fuera fácil de entender para terceros. Tengo conocimientos de Python pero mi principal es Ruby. Así que terminé mejorando un poco en el transcurso del desafío.