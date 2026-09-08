FROM python:3.12-slim

WORKDIR /app

RUN groupadd --gid 1000 cloudguard && \
    useradd --uid 1000 --gid 1000 --create-home --shell /bin/bash cloudguard

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

RUN chown -R 1000:1000 /app

USER 1000:1000

EXPOSE 8080

CMD ["gunicorn", "--bind", "0.0.0.0:8080", "app:app"]
