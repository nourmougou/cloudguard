FROM python:3.12-slim

WORKDIR /app

RUN useradd --create-home --shell /bin/bash cloudguard

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

RUN chown -R cloudguard:cloudguard /app

USER cloudguard

EXPOSE 8080

CMD ["gunicorn", "--bind", "0.0.0.0:8080", "app:app"]
