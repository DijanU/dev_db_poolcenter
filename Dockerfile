# Usa una imagen oficial de Node.js como base
FROM node:20

# Establece el directorio de trabajo en el contenedor
WORKDIR /app

# Copia los archivos del package.json y package-lock.json
COPY package*.json ./

# Instala las dependencias del proyecto
RUN npm install

# Copia el resto del código de la aplicación
COPY . .

# Expone el puerto en el que correrá la app
EXPOSE 3000

# Comando por defecto para correr la app
CMD ["npm", "run", "dev"]
