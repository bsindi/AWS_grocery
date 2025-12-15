# Wenn 3.11 ok ist:
FROM python:3.11-slim
# Falls Libs 3.9 brauchen: FROM python:3.9

WORKDIR /app

# zuerst nur requirements kopieren (bessere Build-Caches)
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# dann den Rest der App
COPY . .

# (Sicherer ist: .env NICHT in die Image backen – stattdessen beim Run als --env-file)
# Wenn du es dennoch reinschreiben willst:
# COPY .env .env

CMD ["python", "run.py"]
