# Stap 1: Gebruik een lichte Python-image als basis
FROM python:3.10-slim

# Zorg dat je OS up-to-date is en benodigde libs binnen zijn
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential gcc libffi-dev && \
    rm -rf /var/lib/apt/lists/*

# Werkdirectory in de container
WORKDIR /app

# Kopieer de vereisten en installeer ze
COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Kopieer alle code naar de container
COPY . .

# Uvicorn starten op poort 80 (optioneel: verander naar 8000)
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "80"]