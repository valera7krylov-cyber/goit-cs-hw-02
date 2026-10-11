FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .

RUN python -c "from pathlib import Path; p=Path('requirements.txt'); raw=p.read_bytes(); text=raw.decode('utf-16') if raw.startswith((b'\xff\xfe', b'\xfe\xff')) else raw.decode('utf-8-sig'); lines=text.splitlines(); lines=[line for line in lines if 'psycopg2==' not in line]; lines=[line.replace('uvicorn[standart]', 'uvicorn[standard]') for line in lines]; lines.append('psycopg2-binary==2.9.9'); Path('requirements-docker.txt').write_text('\n'.join(lines)+'\n', encoding='utf-8')" \
    && pip install --no-cache-dir -r requirements-docker.txt


COPY . .

EXPOSE 8000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]

