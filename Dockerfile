#Usamos la imagen de node 18 como base para nuestra aplicacion
FROM node:18
#Incluimos metadatos
LABEL maintainer="rafaelordonezmolina@gmail.com" \
description="Aplicación de ejemplo" \
version="1.2"
#nos movemos al directorio donde se encuentra el codigo, seria el equivalente a "cd" en linux
WORKDIR /usr/src/app
#incluimos el fichero package.json, donde se encuetran las dependencias necesarias para que la app funcione
COPY package*.json ./
#ejecutamos el siguiente comando para instalar las depencias de la aplicacion
RUN npm install
#usando el siguiente comando, copiaremos todo lo que hay el mismo directorio del dockerfile al lugar actual
#de workdir, en este caso /usr/src/app
COPY . .
#Expondremos el siguiente puerto para conectarnos a la app
EXPOSE 8081
#Añadimos las variable de entorno para que la app se ejecute en el puerto indicado, dado
##que si no añadimos dicha variable, la app esta configurada para funcionar en el puero 4000 por defecto
#La url de la base de datos la incorpramos al hacer docker run, para asi poder configurar la conexion a nuestro gusto
ENV PORT=8081
#Una vez ejecutemos docker run, se lanzara el siguiente comando, de forma que arrancamos la app
ENTRYPOINT [ "npm" ]
#Por defecto arrancamos en modo DEV, aunque podemos sobreescribirlo por start, de forma que la app inicia en modo produccion, ahora mismo usa el modo dev
CMD [ "run", "dev" ]
