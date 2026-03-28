# Spark Connect + Jupyter (Docker)

Jupyter Notebook에서 Spark Connect를 통해 원격 Spark 클러스터의 리소스를 사용하는 환경.

## Architecture

```
┌──────────────┐     gRPC (15002)     ┌──────────────────┐
│   Jupyter    │ ──────────────────── │  Spark Connect   │
│  (PySpark    │                      │     Server       │
│   Client)    │                      │  (local[*])      │
│  :8888       │                      │  :4040 (UI)      │
└──────────────┘                      └──────────────────┘
```

- **Spark Connect Server**: Apache Spark 4.1.1, gRPC 서버로 실행
- **Jupyter Notebook**: PySpark Connect 클라이언트로 Spark에 접속

## Quick Start

```bash
# 1. 컨테이너 빌드 및 실행
docker compose up -d --build

# 2. Jupyter 토큰 확인
docker logs jupyter 2>&1 | grep token

# 3. 브라우저에서 접속
# Jupyter: http://localhost:8888
# Spark UI: http://localhost:4040
```

## Spark Connect 접속 (Notebook)

```python
from pyspark.sql import SparkSession

spark = SparkSession.builder \
    .remote("sc://spark:15002") \
    .getOrCreate()

df = spark.range(10)
df.show()
```

## Stop

```bash
docker compose down
```
