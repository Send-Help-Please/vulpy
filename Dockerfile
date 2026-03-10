FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

WORKDIR /app/bad

RUN python db_init.py

RUN sed -i "s/host='127.0.1.1'/host='0.0.0.0'/" vulpy.py

EXPOSE 5000

CMD ["python", "vulpy.py"]
