# Langkah 1: Menggunakan base image Node.js versi 14
FROM node:14

# Langkah 2: Menentukan working directory untuk container
WORKDIR /app

# Langkah 3: Menyalin seluruh source code ke working directory di container
COPY . .

# Langkah 4: Menentukan environment variables
ENV NODE_ENV=production
ENV DB_HOST=item-db

# Langkah 5: Menginstal dependencies untuk production dan build aplikasi
RUN npm install --production --unsafe-perm && npm run build

# Langkah 6: Ekspos port 8080 yang digunakan oleh aplikasi
EXPOSE 8080

# Langkah 7: Menjalankan server saat container diluncurkan
CMD ["npm", "start"]