# Running

```bash
docker-compose up -d
```

# Demonstrating

Use two shells in demo:

```bash
docker-compose exec demo bash
docker-compose exec demo bash
```

We can now watch the file as we request our server:

```bash
# first
tail -q -c 0 -f /sgx/access.log     | xxd
tail -q -c 0 -f /vanilla/access.log

# second
docker-compose exec demo curl sgx:3000
docker-compose exec demo curl sgx:3000/shutdown

docker-compose exec demo curl vanilla:3000
```

Due to encrypted files being cached and not directly flushed to disk we explicitly shut down the server to trigger the write.
