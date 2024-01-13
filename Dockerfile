# Use an official Rasa image as the base image
FROM rasa/rasa:latest

# Set the working directory
WORKDIR /app

# Copy the entire project into the container
COPY . .

# Install any additional dependencies if needed
# (e.g., if you have custom actions with additional dependencies)
RUN pip install --no-cache-dir -r requirements.txt

# Train the Rasa model during the build process
RUN rasa train

# Expose the necessary port
EXPOSE 5005

# Set the entry point for the container
CMD ["rasa", "run", "--enable-api", "--cors", "*"]
