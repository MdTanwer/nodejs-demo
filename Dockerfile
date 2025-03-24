# Use official Node.js image
FROM node:18

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the entire project
COPY . .

# Build the TypeScript project
RUN npm run build

# Install PM2 globally
RUN npm install -g pm2

# Expose the port (optional: change according to your app)
EXPOSE 3000

# Start the app using PM2 (assuming your built app entry point is in dist/index.js)
CMD ["pm2-runtime", "dist/app.js"]
