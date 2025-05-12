# Используем облегчённый Alpine-образ с Node.js 18
FROM node:18-alpine                                 
# Задаём рабочую директорию /app внутри контейнера
WORKDIR /app                                        
# Копируем манифесты зависимостей и устанавливаем только production-зависимости
COPY package*.json ./                               
RUN npm install --production                        
# Копируем остальной код приложения
COPY . .                                             
# Открываем порт 3000 для HTTP-трафика
EXPOSE 3000                                          
# Запускаем сервер
CMD ["node", "server.js"]                            
